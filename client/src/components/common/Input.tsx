import styled from "styled-components"

interface Props {
  variant: string
}

const Button = styled.button<Props>`
  outline: none;
  border: 0;
  background-color: var(--color-blue);
  text-transform: uppercase;
  width: 100%;
  height: 50px;
  color: white;
  font-weight: bold;
  border-radius: 15px;
  box-shadow: 0px 5px 0 var(--color-blue50);
`

export default Button;