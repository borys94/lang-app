import styled, {css} from "styled-components";

const Box = styled.div.attrs<any>(({success, progress}: any) => ({
  style: {
    backgroundColor: success ? "#668cff" : "white",
    ...(progress && progress === 1 ? {
      backgroundColor: "var(--color-green)"
    } : {}),
    ...(progress && progress < 1 && progress > 0 ? {
      backgroundColor: "var(--color-yellow)"
    } : {})
  }
}))<any>`
  position: relative;
  border-radius: 3px;
  padding: 5px 10px;
  
  display: flex;
  margin: 5px 0;

  display: flex;
  box-shadow: 0 2px 3px rgb(111 123 138 / 11%);
  background-color: white;

  display: flex;
  justify-content: flex-start;
  align-items: center;

  :hover {
    ${props => props.hoverable !== false ? css`
      background-color: #fbfbfb;
      cursor: pointer;
    ` : ""}
  }
`;

export default Box

