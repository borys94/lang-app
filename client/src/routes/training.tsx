import { useState, useEffect } from 'react';
import styled from "styled-components";
import { Button, Modal, Form } from "react-bootstrap";

import api from "$services/api";
import FlashCard from "$components/FlashCard"

function shuffle(array: any[]) {
  let currentIndex = array.length,  randomIndex;

  // While there remain elements to shuffle...
  while (currentIndex != 0) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [array[currentIndex], array[randomIndex]] = [
      array[randomIndex], array[currentIndex]];
  }

  return array;
}

const Container = styled.div`
  display: flex;
  align-items: center;
  flex-direction: column;
`;

const GROUP = 100;

export default function Training() {
  const [training, setTraining] = useState([] as any);
  const [notes, setNotes] = useState([] as any);
  useEffect(() => {
    const fetchTraining = async () => {
      const training = await api.getTraining();
      let destinatedWords = []
      for(let i=0; i<training.length; i+=GROUP) {
        const arr = training.slice(i, i+GROUP);
        const reversed = arr.map((t: any) => ({
          ...t,
          translated: t.value,
          value: t.translated,
          reversed: true,
        }))
        destinatedWords.push(...shuffle(arr));
        // destinatedWords.push(...shuffle(reversed));
      }
      
      setTraining(destinatedWords)
    }

    fetchTraining();
  }, []);

  const updateTraining = async (note: number) => {
    const trainingNotes = [...notes, {
      ...training[0],
      note
    }];
    setNotes(trainingNotes)
    const thisWords = trainingNotes.filter(trainingNote => {
      return trainingNote.external_id === training[0].external_id && trainingNote.type === training[0].type && trainingNote.note > 1
    });

    if (note === 1) {
      setTraining([...training.filter((t: any) => t.word_id !== training[0].word_id || t.reversed !== training[0].reversed), {...training[0], firstNote: 1}]);
      return
    } else {
      setTraining([...training.filter((t: any) => t.word_id !== training[0].word_id || t.reversed !== training[0].reversed)]);
    }

    if (thisWords.length >= 1) {
      const id = training[0].training_id;
      const wordId = training[0].word_id;
      const n = Math.min(...trainingNotes.filter(trainingNote => {
        return trainingNote.external_id === training[0].external_id && trainingNote.type === training[0].type
      }).map(t => t.note));
      console.log('update', training[0].value, n)
      await api.updateTraining(id, wordId, n);
    }
    
  }

  return (
    <Container>
      <h1>Training: {training.length}</h1>
      <div style={{height: "200px", width: "300px", margin: "10px 0"}}>
        {training.length > 1 && (
          <FlashCard
            key={training.length && training[1].translated}
            frontText={training.length && training[1].translated}
            backText={training.length && training[1].value}
          />
        )}
        <FlashCard
          key={training.length && training[0].translated}
          frontText={training.length && training[0].translated}
          backText={training.length && training[0].value}
          onSlide={updateTraining}
        />
      </div>
      <div>
        <Button onClick={() => updateTraining(1)}>1</Button>
        <Button onClick={() => updateTraining(2)}>2</Button>
        <Button onClick={() => updateTraining(3)}>3</Button>
      </div>
    </Container>
  );
}