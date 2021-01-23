package st.malike.manifest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import st.malike.manifest.exception.MissingParameterException;
import st.malike.manifest.util.JSONResponse;

/**
 * @ malike_st
 */
public class ExceptionController {

  @ExceptionHandler(MissingParameterException.class)
  @ResponseBody
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public JSONResponse missingParameterException(MissingParameterException e) {
    JSONResponse jSONResponse = new JSONResponse();
    jSONResponse.setStatus(false);
    jSONResponse.setMessage("Required parameter missing");
    jSONResponse.setResult(HttpStatus.BAD_REQUEST);
    return jSONResponse;
  }


}
