package dev.consentix.openfinance.controller;

import java.time.LocalDateTime;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class StatusController {

    /**
     * GET /status
     * 
     * @return 200 OK com o corpo "OK"
     */
    @GetMapping("/status")
    public ResponseEntity<String> status() {
        return ResponseEntity.ok("OK " + LocalDateTime.now());
    }
}
