package com.campus.myapp.config;

public class BaseResponse<G> {
    public Boolean success;
    public String message;

    public BaseResponse(G getSocialOAuthRes) {
    }
}