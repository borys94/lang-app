import { useState } from "react";
import { Form } from "react-bootstrap";
import LanguageService, { LangType } from "$services/language";

export default () => {
  const [lang, setLang] = useState(LanguageService.get());

  const setLanguage = (l: LangType) => {
    setLang(l)
    LanguageService.set(l)
  }

  return (
    <div>
      <Form.Group controlId="formLevel">
        <Form.Select aria-label="Level select" value={lang} onChange={(e) => setLanguage(e.target.value as LangType)}>
          <option value="Spanish">Spanish</option>
          <option value="English">English</option>
          <option value="German">German</option>
        </Form.Select>
      </Form.Group>
    </div>
  )
}