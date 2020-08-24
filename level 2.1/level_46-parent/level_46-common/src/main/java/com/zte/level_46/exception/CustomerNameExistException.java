package com.zte.level_46.exception;

/**
 * Author:msy
 * Date:2020-06-11 21:41
 * Description:<描述>
 */
public class CustomerNameExistException extends Exception {
    public CustomerNameExistException() {
    }

    public CustomerNameExistException(String message) {
        super(message);
    }

    public CustomerNameExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public CustomerNameExistException(Throwable cause) {
        super(cause);
    }

    public CustomerNameExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
