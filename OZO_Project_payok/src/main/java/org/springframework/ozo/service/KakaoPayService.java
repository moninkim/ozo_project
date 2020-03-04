package org.springframework.ozo.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.ozo.domain.KakaoPayApproval;
import org.springframework.ozo.domain.KakaoPayReady;
import org.springframework.ozo.domain.Reserve;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import jdk.nashorn.internal.runtime.logging.Logger;

import org.springframework.stereotype.Service;


@Service
public class KakaoPayService {
	 
    private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReady kakaoPayReady;
    private KakaoPayApproval kakaoPayApproval;
    
    public String kakaoPayReady(Reserve reserve) {
 
        RestTemplate restTemplate = new RestTemplate();
 

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "7214a7b782969ea2ee43a8bce8539fc1");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
                
        
        MultiValueMap<String, String> paymentParam = new LinkedMultiValueMap<String, String>();
        paymentParam.add("cid", "TC0ONETIME");
        paymentParam.add("partner_order_id", "1001");
        paymentParam.add("partner_user_id", reserve.getMember().getMemId());
        paymentParam.add("item_name", reserve.getSpace().getTitle() + "  예약");
        paymentParam.add("quantity", "1");
        paymentParam.add("total_amount", String.valueOf(reserve.getTotal_cost()));
        paymentParam.add("tax_free_amount", "100");
        paymentParam.add("approval_url", "http://localhost:8090/OZO_Project/kakaoPaySuccess");
        paymentParam.add("cancel_url", "http://localhost:8090/OZO_Project/kakaoPayError");
        paymentParam.add("fail_url", "http://localhost:8090/OZO_Project/kakaoPayError");
        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(paymentParam, headers);
 
        try {
            	kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);
            	return kakaoPayReady.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    
    public KakaoPayApproval kakaoPayInfo(String pg_token, Reserve reserve) {
 
        RestTemplate restTemplate = new RestTemplate();
 

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "7214a7b782969ea2ee43a8bce8539fc1");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 

        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReady.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", reserve.getMember().getMemId());
        params.add("pg_token", pg_token);
        params.add("total_amount", String.valueOf(reserve.getTotal_cost()));
        
        
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApproval = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproval.class);         
            return kakaoPayApproval;
        
        } catch (RestClientException e) {          
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
}