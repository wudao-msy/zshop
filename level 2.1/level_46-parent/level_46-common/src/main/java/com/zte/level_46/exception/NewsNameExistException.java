package com.zte.level_46.exception;

/**
 * Author:msy
 * Date:2020-06-11 21:41
 * Description:<描述>
 */
public class NewsNameExistException extends Exception {
    public NewsNameExistException() {
    }

    public NewsNameExistException(String message) {
        super(message);
    }

    public NewsNameExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public NewsNameExistException(Throwable cause) {
        super(cause);
    }

    public NewsNameExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
