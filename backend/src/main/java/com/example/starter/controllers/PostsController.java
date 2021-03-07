package com.example.starter.controllers;

import com.example.starter.entities.Post;
import com.example.starter.repositories.PostsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class PostsController {
    @Autowired
    public PostsController(PostsRepository postsRepository) {
        this.postsRepository = postsRepository;
    }
    private PostsRepository postsRepository;

    @GetMapping("/posts")
    public ResponseEntity<List<Post>> getAllPosts() {
        List<Post> posts = postsRepository.findAll();
        return new ResponseEntity<>(posts, HttpStatus.OK);
    }

    @PostMapping("/posts")
    public ResponseEntity<Post> postPosts(@RequestBody Post post) {
        postsRepository.save(post);
        return new ResponseEntity<>(post, HttpStatus.OK);
    }

    @GetMapping("/posts/{id}")
    public ResponseEntity<Post> getPostById(@PathVariable Long id) {
        Optional<Post> post = postsRepository.findById(id);
        if (post.isPresent()) {
            return new ResponseEntity<>(post.get(), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/posts/{id}")
    public ResponseEntity<Post> deletePostById(@PathVariable Long id) {
        Optional<Post> post = postsRepository.findById(id);
        if(post.isPresent()) {
            postsRepository.delete(post.get());
            return new ResponseEntity<>(post.get(), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/posts/{id}")
    public ResponseEntity<Post> updatePostById(@PathVariable Long id, @RequestBody Post postUpdate) {
        Optional<Post> post = postsRepository.findById(id);
        if(post.isPresent()) {
            Post unwrappedPost = post.get();
            unwrappedPost.setText(postUpdate.getText());
            postsRepository.save(unwrappedPost);
            return new ResponseEntity<>(unwrappedPost, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
