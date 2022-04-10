import { useState, useEffect } from "react"
import styled from "styled-components";

function componentToHex(c: number) {
  var hex = c.toString(16);
  return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r: number, g: number, b: number) {
  return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function hexToRgb(hex: string) {
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result ? {
    r: parseInt(result[1], 16),
    g: parseInt(result[2], 16),
    b: parseInt(result[3], 16)
  } : {r: 0, g: 0, b: 0};
}

interface ContainerProps {
  deltaX: number;
  deltaY: number;
}

const Container = styled.div.attrs<ContainerProps>( ({deltaX, deltaY}: ContainerProps) => {
  const maxShift = 150;
  
  let color = "#ffffff";
  if (deltaY > 0 && Math.abs(deltaX) < deltaY) {
    color = "ffc300";
  } else if (deltaX < 0) {
    color = "fa3c4c";
  } else if (deltaX > 0) {
    color = "44bec7";
  }
  let {r,g,b} = hexToRgb(color);
  
  if (deltaY > 0 && Math.abs(deltaX) < deltaY) {
    r = Math.floor(255 - (255 - r) * (Math.min(Math.abs(deltaY), maxShift) / maxShift));
    g = Math.floor(255 - (255 - g) * (Math.min(Math.abs(deltaY), maxShift) / maxShift));
    b = Math.floor(255 - (255 - b) * (Math.min(Math.abs(deltaY), maxShift) / maxShift));
  } else {
    r = Math.floor(255 - (255 - r) * (Math.min(Math.abs(deltaX), maxShift) / maxShift));
    g = Math.floor(255 - (255 - g) * (Math.min(Math.abs(deltaX), maxShift) / maxShift));
    b = Math.floor(255 - (255 - b) * (Math.min(Math.abs(deltaX), maxShift) / maxShift));
  }

  return {
    style: {
      transform: `translate(${deltaX}px, ${deltaY}px)`,
      ...(deltaX && deltaY ? {
        backgroundColor: rgbToHex(r, g, b)
      } : {}),
    }
  }
})<ContainerProps>`
  width: 300px;
  height: 200px;
  overflow: hidden;
  position: relative;
  background-color: white;
  box-shadow: 0 2px 3px rgb(111 123 138 / 11%);
  cursor: pointer;
  font-size: 28px;
  font-weight: bold;
  position: absolute;
  touch-action: none;
`;

interface SideProps {
  visible: boolean
}

const Side = styled.div`
  backface-visibility: hidden;
  transition: transform 200ms;
  width: 300px;
  height: 200px;
  
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  pointer-events: none;
`;

const FrontSide = styled(Side).attrs((props: SideProps) => ({
  style: {
    transform: props.visible ? "translateY(0)" : "translateY(-200px)"
  }
}))<SideProps>``;

const BackSide = styled(Side).attrs((props: SideProps) => ({
  style: {
    transform: props.visible ? "translateY(0)" : "translateY(200px)"
  }
}))<SideProps>``;

interface Props {
  frontText: string;
  backText: string;
  onSlide?: (value: number) => void
}

const FlashCard = ({
  frontText,
  backText,
  onSlide
}: Props) => {
  const [flipped, setFlipped] = useState(false);
  const [startPointerX, setStartPointerX] = useState<number | null>(null);
  const [startPointerY, setStartPointerY] = useState<number | null>(null);
  const [currentPointerX, setCurrentPointerX] = useState<number | null>(null);
  const [currentPointerY, setCurrentPointerY] = useState<number | null>(null);

  useEffect(() => {
    setFlipped(false);
  }, [frontText])

  const onTouchStart = (event: React.TouchEvent<HTMLDivElement>) => {
    setStartPointerX(event.touches[0].clientX);
    setStartPointerY(event.touches[0].clientY);
    // console.log(event)
  }

  const onTouchMove = (event: React.TouchEvent<HTMLDivElement>) => {
    if (startPointerX && startPointerY) {
      setCurrentPointerX(event.touches[0].clientX);
      setCurrentPointerY(event.touches[0].clientY);
    }
  }

  const onTouchEnd = (event: React.TouchEvent<HTMLDivElement>) => {
    const deltaX = getDeltaX();
    const deltaY = getDeltaY();
    if (startPointerX && Math.abs(deltaX) < 2 && Math.abs(deltaY) < 2) {
      setFlipped(!flipped)
    }

    slide();
  
    setStartPointerX(null);
    setStartPointerY(null);
    setCurrentPointerX(null);
    setCurrentPointerY(null);
  }

  const slide = () => {
    const deltaX = getDeltaX();
    const deltaY = getDeltaY();
    if (deltaY > 100 && Math.abs(deltaX) < deltaY) {
      onSlide && onSlide(2)
    } else if (deltaX < -100) {
      onSlide && onSlide(1)
    } else if (deltaX > 100) {
      onSlide && onSlide(3)
    }
  }

  const getDeltaX = () => {
    return currentPointerX !== null && startPointerX !== null ? currentPointerX - startPointerX : 0;
  }

  const getDeltaY = () => {
    return currentPointerY !== null && startPointerY !== null ? currentPointerY - startPointerY : 0;
  }

  return (
    <Container
      onTouchStart={onTouchStart}
      onTouchMove={onTouchMove}
      onTouchEnd={onTouchEnd}
      deltaX={getDeltaX()}
      deltaY={getDeltaY()}
    >
      <FrontSide visible={!flipped}>
        {frontText}
      </FrontSide>
      <BackSide visible={flipped}>
        {backText}
      </BackSide>
    </Container>
  );
}

export default FlashCard