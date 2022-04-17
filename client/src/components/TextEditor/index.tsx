import React, { Component } from 'react';
import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

// import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor';



interface Props {
  value: string;
  onChange: (data: string) => void
}

export default class TextEditor extends Component<Props> {
    render() {
        return (
            <div className="App">
                <CKEditor
                    editor={ ClassicEditor as any }
                    data={this.props.value}
                    onReady={ (editor: any) => {
                        // You can store the "editor" and use when it is needed.
                    } }
                    onChange={ ( event: any, editor: any ) => {
                        const data = editor.getData();
                        this.props.onChange(data);
                    } }
                    onBlur={ ( event: any, editor: any ) => {
                    } }
                    onFocus={ ( event: any, editor: any ) => {
                    } }
                />
            </div>
        );
    }
}