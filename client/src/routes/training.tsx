import { useState } from 'react';
import {useEffect} from "react"
import { Button, Modal, Form } from "react-bootstrap";

import api from "$services/api";
import Card from "$components/common/Card"

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

export default function Training() {
  const [training, setTraining] = useState([] as any)
  const [reversedCard, setReversedCard] = useState(false)
  useEffect(() => {
    const fetchLessons = async () => {
      const training = await api.getTraining();
      setTraining(shuffle(training as any))
    }

    fetchLessons();
  }, []);

  const updateTraining = async (note: number) => {
    if (note === 1) {
      setTraining([...training.filter((t: any) => t.id !== training[0].id), {...training[0], firstNote: 1}]);
      return
    } else {
      setTraining([...training.filter((t: any) => t.id !== training[0].id)]);
    }
    setReversedCard(false)
    const id = training[0].id;
    const n = training[0].firstNote || note
    // await api.updateTraining(id, n);
  }

  return (
    <div>
      <h1>Training: {training.length}</h1>

      <Card onClick={() => setReversedCard(!reversedCard)}>
        {
          reversedCard ?
            <span>{training.length && training[0].value}</span> :
            <span>{training.length && training[0].translated}</span>
        }
      </Card>

      <Button onClick={() => updateTraining(1)}>1</Button>
      <Button onClick={() => updateTraining(2)}>2</Button>
      <Button onClick={() => updateTraining(3)}>3</Button>

    </div>
  );
}