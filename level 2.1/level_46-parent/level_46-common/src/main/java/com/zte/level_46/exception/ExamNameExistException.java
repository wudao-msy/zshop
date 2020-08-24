package com.zte.level_46.exception;

/**
 * Author:msy
 * Date:2020-06-11 21:41
 * Description:<描述>
 */
public class ExamNameExistException extends Exception {
    public ExamNameExistException() {
    }

    public ExamNameExistException(String message) {
        super(message);
    }

    public ExamNameExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public ExamNameExistException(Throwable cause) {
        super(cause);
    }

    public ExamNameExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
