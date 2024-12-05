package org.example.wsd_proj.Service;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RecipeService {
    private final String API_URL = "http://openapi.foodsafetykorea.go.kr/api/3649564af8f14222a7d2/COOKRCP01/json/1/1";

    public JsonNode getRecipes() throws JsonProcessingException {
        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(API_URL, String.class);

        ObjectMapper mapper = new ObjectMapper();
        return mapper.readTree(response); // JSON 객체로 반환
    }
}
