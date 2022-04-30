import {useState} from 'react';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select, { SelectChangeEvent } from '@mui/material/Select'

import LevelService, { LevelType } from "$services/level";

// const Container = styled.div`
//   width: 200px;
// `;

interface Props {
  level: string;
  setLevel: (level: LevelType) => void;
}

const LessonLevelDropdown = ({level, setLevel}: Props) => {
  const onSetLevel = (level: LevelType) => {
    LevelService.set(level);
    setLevel(level)
  };

  return (
    <FormControl variant="standard" sx={{ m: 1, minWidth: 120 }}>
      <InputLabel id="demo-simple-select-standard-label">Level</InputLabel>
      <Select
        labelId="demo-simple-select-standard-label"
        id="demo-simple-select-standard"
        value={level}
        onChange={(e) => onSetLevel(e.target.value as any as LevelType)}
        label="Level"
      >
        <MenuItem value="A1">A1</MenuItem>
        <MenuItem value="A2">A2</MenuItem>
        <MenuItem value="B1">B1</MenuItem>
        <MenuItem value="B2">B2</MenuItem>
        <MenuItem value="C1">C1</MenuItem>
        <MenuItem value="C2">C2</MenuItem>
      </Select>
    </FormControl>
  );
}

export default LessonLevelDropdown