import {useState} from "react";
import axios from "axios";
import {API_URL} from "../config";

const NewPost = () => {
    const [text, setText] = useState('')
    const handleSubmit = (e) => {
        e.preventDefault();
        axios.post(`${API_URL()}/posts`, {text}).then(response => {
            console.log(response);
            setText('');
            alert('post created');
        }).catch(error => {
            console.error(error);
            alert('failed to create post');
        });
    }
    const handleChange = (e) => {
        setText(e.target.value);
    }
    return (
        <div>
            <h1>New Post</h1>
            <form onSubmit={handleSubmit}>
                <input type={'text'} placeholder={'Text'} onChange={handleChange}/>
                <br/>
                <input type={'submit'} value={'Add'}/>
            </form>
        </div>
    );
};

export default NewPost;