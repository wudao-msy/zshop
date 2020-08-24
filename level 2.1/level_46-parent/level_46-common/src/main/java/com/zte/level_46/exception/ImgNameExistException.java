package com.zte.level_46.exception;

/**
 * Author:msy
 * Date:2020-07-29 17:17
 * Description:<描述>
 */
public class ImgNameExistException extends Exception {
    public ImgNameExistException() {
        super();
    }

    public ImgNameExistException(String message) {
        super(message);
    }

    public ImgNameExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public ImgNameExistException(Throwable cause) {
        super(cause);
    }

    protected ImgNameExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
