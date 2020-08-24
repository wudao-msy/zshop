package com.zte.level_46.exception;

/**
 * Author:msy
 * Date:2020-06-11 21:41
 * Description:<描述>
 */
public class StudentNameExistException extends Exception {
    public StudentNameExistException() {
    }

    public StudentNameExistException(String message) {
        super(message);
    }

    public StudentNameExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public StudentNameExistException(Throwable cause) {
        super(cause);
    }

    public StudentNameExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
