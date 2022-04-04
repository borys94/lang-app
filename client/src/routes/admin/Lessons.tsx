import {useState, useEffect} from "react";
import { useNavigate } from "react-router-dom";
import { Button } from "react-bootstrap"

import { useAppSelector } from '$hooks/index';
import AddLessonModal from "$components/Modals/AddLesson";
import Box from "$components/common/Box";

export default function Lessons() {
  const navigate = useNavigate();
  const lessons = useAppSelector(state => {
    return state.lessons.lessons;
  });

  const goToLesson = (id: number) => {
    navigate(`/admin/lessons/${id}`);
  }

  const [showModal, setShowModal] = useState(false);

  return (
    <div>
      <div>
        <Button onClick={() => setShowModal(true)}>Add lesson</Button>
      </div>
      <AddLessonModal show={showModal} close={() => setShowModal(false)} />
      <div className="row">
        {lessons.map((lesson: any) => (
          <div className="col-md-6 col-lg-4" key={lesson.id} onClick={() => goToLesson(lesson.id)}>
            <Box>
              <span style={{marginRight: "10px"}}>{lesson.name}</span><b>{lesson.level}</b>
              <span style={{marginLeft: "auto"}}>
                {lesson.added}
                {" "}
                {+lesson.allwords + +lesson.allsentences}
              </span>
            </Box>
          </div>
        ))}
      </div>
    </div>
  );
}