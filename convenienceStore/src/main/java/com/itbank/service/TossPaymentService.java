package com.itbank.service;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class TossPaymentService {

    private final RestTemplate restTemplate;

    public TossPaymentService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public void authorizePayment(String paymentKey, String orderId, int amount) {
        String url = "https://api.tosspayments.com/v1/payments/confirm";
        
        // Base64로 시크릿 키 인코딩
        String secretKey = "test_sk_ZLKGPx4M3M95RKxwR96R3BaWypv1";
        String encodedSecretKey = Base64.getEncoder().encodeToString((secretKey + ":").getBytes(StandardCharsets.UTF_8));
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.add("Authorization", "Basic " + encodedSecretKey);
        
        // 결제 데이터를 JSON 형태로 준비
        String jsonBody = String.format("{\"paymentKey\":\"%s\",\"orderId\":\"%s\",\"amount\":%d}", paymentKey, orderId, amount);

        HttpEntity<String> request = new HttpEntity<>(jsonBody, headers);

        // POST 요청
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, request, String.class);
        
        if (!response.getStatusCode().equals(HttpStatus.OK)) {
            throw new RuntimeException("결제 승인 요청 실패");
        }

        System.out.println(response.getBody());
    }
	
}
