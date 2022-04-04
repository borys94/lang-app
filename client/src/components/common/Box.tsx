import styled from "styled-components";

const Box = styled.div.attrs<any>(({success}: any) => ({
  style: {
    backgroundColor: success ? "var(--bs-green)" : "white"
  }
}))<any>`
  position: relative;
  border-radius: 3px;
  padding: 5px 10px;
  cursor: pointer;
  display: flex;
  margin: 5px 0;

  display: flex;
  box-shadow: 0 2px 3px rgb(111 123 138 / 11%);
  background-color: white;

  display: flex;
  justify-content: flex-start;
  align-items: center;

  :hover {
    background-color: #fbfbfb;
  }
`;

export default Box

