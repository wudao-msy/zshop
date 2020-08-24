package com.zte.level_46.exception;

/**
 * Author:msy
 * Date:2020-07-29 17:17
 * Description:<描述>
 */
public class PdfNameExistException extends Exception {
    public PdfNameExistException() {
        super();
    }

    public PdfNameExistException(String message) {
        super(message);
    }

    public PdfNameExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public PdfNameExistException(Throwable cause) {
        super(cause);
    }

    protected PdfNameExistException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
