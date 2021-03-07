package com.example.starter.controllers;

import com.example.starter.models.HealthStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    @GetMapping("/health")
    HealthStatus getStatus() {
        return new HealthStatus("Ok");
    }
}
