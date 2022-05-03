import React from 'react';
import HtmlToReact from 'html-to-react';

const HtmlToReactParser = (HtmlToReact as any).Parser;

const htmlToReactParser = new HtmlToReactParser();
const htmlInput = '<div><div data-test="foo"><p>Text</p><p>Text</p></div></div>';
const htmlExpected = '<div><div data-test="foo"><h1>Heading</h1></div></div>';

const isValidNode = function () {
  return true;
};

const processNodeDefinitions = new (HtmlToReact as any).ProcessNodeDefinitions(React);

function getProcessingInstructions(process: any) {
  return [
    {
      // This is REQUIRED, it tells the parser
      // that we want to insert our React
      // component as a child
      replaceChildren: true,
      shouldProcessNode: function (node: any) {
        return node.name === "v"
        // return node.attribs && node.attribs['data-test'] === 'foo';
      },
      processNode: function (node: any, children: any, index: any) {
        return process(node, children, index);
        // console.log(index)
        // return <Cmp value={answers[index] || ""} setValue={(v: any) => setAnswers(index, v)} />
        // // return <input />
        // return React.createElement('h1', {key: index,}, 'Heading');
      }
    },
    {
      // Anything else
      shouldProcessNode: function (node: any) {
        return true;
      },
      processNode: processNodeDefinitions.processDefaultNode,
    },
  ];
}

// Order matters. Instructions are processed in
// the order they're defined


// const reactComponent = htmlToReactParser.parseWithInstructions(
//   htmlInput, isValidNode, getProcessingInstructions());
// const reactHtml = ReactDOMServer.renderToStaticMarkup(
//   reactComponent);

export default function(input: string, process: any) {
  return htmlToReactParser.parseWithInstructions(
    input, isValidNode, getProcessingInstructions(process));
}
