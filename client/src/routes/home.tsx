import { useNavigate } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBriefcase, faBook, faUserGear, faUserSecret } from '@fortawesome/free-solid-svg-icons';

import Card from "$components/common/Card"

export default function Home() {
  const navigate = useNavigate();
  return (
    <div className="container">
      <div className="row">
        <div className="col-md-6">
          <Card onClick={() => navigate("profile")}>
            <FontAwesomeIcon size="3x" icon={faUserGear} />
            <div>
              <b>User</b>
            </div>
          </Card>
          <Card color="green" onClick={() => navigate("admin")}>
            <FontAwesomeIcon size="3x" icon={faUserSecret} />
            <div>
              <b>Admin</b>
            </div>
          </Card>
        </div>
        <div className="col-md-6">
          <Card onClick={() => navigate("wordCategories")}>
            <FontAwesomeIcon size="3x" icon={faBook} />
            <div>
              <b>Words</b>
              <span>Next lesson: Czas teraźniejszy</span>
            </div>
          </Card>
          <Card onClick={() => navigate("grammar")}>
            <FontAwesomeIcon size="3x" icon={faBook} />
            <div>
              <b>Grammar</b>
              <span>Next lesson: Czas teraźniejszy</span>
            </div>
          </Card>
          <Card onClick={() => navigate("training")}>
            <FontAwesomeIcon size="3x" icon={faBriefcase} />
            <div>
              <b>Daily Training</b>
              <span>Next lesson: Czas teraźniejszy</span>
            </div>
          </Card>
          <Card onClick={() => navigate("exercises")}>
            <FontAwesomeIcon size="3x" icon={faBriefcase} />
            <div>
              <b>Exercises</b>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
}