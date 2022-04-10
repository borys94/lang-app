import styled from "styled-components";

interface Props {
  color?: string
}

const Card = styled.div.attrs<Props>((props) => ({
  style: {
    backgroundColor: props.color ? "var(--color-green)" : "white"
  }
}))<Props>`
  position: relative;
  border-radius: 3px;
  padding: 10px;
  cursor: pointer;
  display: flex;
  margin: 5px 0;

  display: flex;
  box-shadow: 0 2px 3px rgb(111 123 138 / 11%);
  background-color: white;

  display: flex;
  justify-content: flex-start;
  align-items: center;

  div {
    display: flex;
    flex-direction: column;
    margin: auto 15px;
  }
`;

export default Card

