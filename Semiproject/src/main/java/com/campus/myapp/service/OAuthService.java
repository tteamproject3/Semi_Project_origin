package com.campus.myapp.service;

import com.campus.myapp.config.*;
import com.campus.myapp.dao.UserDAO;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class OAuthService {
    @Autowired
    UserDAO dao;

    private final GoogleOauth googleOauth;
    private final HttpServletResponse response;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public String request(Constant.SocialLoginType socialLoginType) throws IOException {
        String redirectURL;
        switch (socialLoginType) {
            case GOOGLE: {
                //각 소셜 로그인을 요청하면 소셜로그인 페이지로 리다이렉트 해주는 프로세스이다.
                redirectURL = googleOauth.getOauthRedirectURL();
                logger.info(redirectURL);
            }
            break;
            default: {
                throw new IllegalArgumentException("알 수 없는 소셜 로그인 형식입니다.");
            }

        }

        return redirectURL;
    }

    public GoogleUser oAuthLogin(Constant.SocialLoginType socialLoginType, String code) throws IOException {
        logger.info(socialLoginType.toString());

                //구글로 일회성 코드를 보내 액세스 토큰이 담긴 응답객체를 받아옴
                ResponseEntity<String> accessTokenResponse = googleOauth.requestAccessToken(code);
                logger.info(accessTokenResponse.toString());
                //응답 객체가 JSON형식으로 되어 있으므로, 이를 deserialization해서 자바 객체에 담을 것이다.
                GoogleOAuthToken oAuthToken = googleOauth.getAccessToken(accessTokenResponse);
                logger.info(oAuthToken.toString());
                //액세스 토큰을 다시 구글로 보내 구글에 저장된 사용자 정보가 담긴 응답 객체를 받아온다.
                ResponseEntity<String> userInfoResponse = googleOauth.requestUserInfo(oAuthToken);
                logger.info(userInfoResponse.toString());
                //다시 JSON 형식의 응답 객체를 자바 객체로 역직렬화한다.
                GoogleUser googleUser = googleOauth.getUserInfo(userInfoResponse);
                logger.info(googleUser.toString());
                return googleUser;
    }

}



