codeunit 50111 "DHLP Integeration"
{
    trigger OnRun()
    begin
        Authenticate();
    end;

    local procedure Intialize()
    begin

    end;

    local procedure Authenticate()
    var
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        RequestJSON: Text;
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        RequestContent: HttpContent;
        ResponseMessage: HttpResponseMessage;
        RequestMessage: HttpRequestMessage;
        ResponseText: Text;
        RequestUrl: Text;

        contentHeaders: HttpHeaders;
    begin
        JsonObject.Add('Username', '08007639FONTINI');
        JsonObject.Add('Password', '3be966b7-98ef-4269-a511-c69eaff01589');
        //JsonArray.Add(JsonObject);ed
        JsonObject.WriteTo(RequestJSON);
        Message(RequestJSON);
        RequestUrl := 'https://external.dhl.es/cimapi/api/v1/customer/authenticate';
        RequestHeaders := Client.DefaultRequestHeaders();

        RequestContent.WriteFrom(RequestJSON);

        RequestContent.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        //contentHeaders.Add('Content-Type', 'application/json');
        Client.Post(RequestURL, RequestContent, ResponseMessage);
        ResponseMessage.Content().ReadAs(ResponseText);
        Message(ResponseText);
        if ResponseMessage.HttpStatusCode = 200 then
            "Bearer Token" := DELchr(ResponseText, '=', '"')
        else
            Error(ResponseText);


    end;

    var
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonValue: JsonValue;
        "Bearer Token": Text;
    //   StringWriter: DotNet StringWriter;
    // JSONTextWriter: DotNet JsonTextWriter;
}