import {useEffect, useState} from "react";
import axios from "axios";
import {API_URL} from "../config";
import {Link} from "react-router-dom";

const Posts = () => {
    const [posts, setPosts] = useState([]);

    const load = () => {
        axios.get(`${API_URL()}/posts`)
            .then(response => setPosts(response.data))
            .catch(error => console.error(error))
    };

    useEffect(load, []);

    const deletePost = (post) => {
        axios.delete(`${API_URL()}/posts/${post.id}`).then(response => {
            console.log(response);
            load();
        }).catch(error => {
            console.error(error);
        });
    }

    return (
        <div>
            <h1>Posts</h1>
            <Link to={'/posts/new'}>Add post</Link>
            <ul>
                {posts.map((post, i) => (
                    <li key={i}>
                        {post.text}
                        <button onClick={() => {
                            deletePost(post);
                        }}>delete</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default Posts;