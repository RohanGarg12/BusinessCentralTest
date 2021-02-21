/// <summary>
/// Codeunit SendMail (ID 50105).
/// </summary>
codeunit 50105 SendMail
{


    /// <summary>
    /// Email.
    /// </summary>
    procedure Email()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        ErrorMessageManagement: Codeunit "Error Message Management";
        HtmlFormated: Boolean;
        ToList: List of [Text];
        CcList: List of [Text];
        BccList: List of [Text];
        Outs: OutStream;
        TempEmailModuleAccount: Record "Email Account";
        TempEmailItem: Record "Email Item";

    begin
        TempEmailItem."From Address" := 'rohan.garg@mindshell.info';
        TempEmailItem."Send to" := 'rohangrg110@gmail.com';
        TempEmailItem.Subject := 'Text';
        TempEmailItem.Body.CreateOutStream(Outs);
        HtmlFormated := true;

        Outs.WriteText('Dear Sir,');
        Outs.WriteText('<table style="  font-family: arial, sans-serif; border-style: solid ;border-collapse: collapse;width: 100%; ">');
        Outs.WriteText('<tr  >');
        Outs.WriteText('<th style=" font-family: Lato-Bold;font-size: 12px; text-align: left; color: #fff;line-height: 1.8;background-color: #6c7ae0">Container No.</th>');
        Outs.WriteText('<th style=" font-family: Lato-Bold;font-size: 12px; text-align: left; color: #fff;line-height: 1.8;background-color: #6c7ae0">Size </th>');
        Outs.WriteText('</tr>');
        Outs.WriteText('<TR>');
        Outs.WriteText(' <th style=" font-size: 14px; border: 1px solid #dddddd;text-align: left;padding: 8px; font-size: 10px;"  >1000</th>');
        Outs.WriteText('<th style=" font-size: 14px; border: 1px solid #dddddd;text-align: left;padding: 8px; font-size: 10px;"  >chck</th>');
        Outs.WriteText('</TR>');
        Outs.WriteText('</table>');
        EmailMessage.Create('rohangrg110@gmail.com', 'Test', TempEmailItem.GetBodyText(), true);

        Email.Send(EmailMessage);

    end;

    /// <summary>
    /// SendMail.
    /// </summary>
    procedure SendMail()
    var
        EmailMessage: Codeunit "Email Message";
        EmailItem: Record "Email Item" temporary;
        Customer: Record Customer;
        Recref: RecordRef;
        Outs: OutStream;
        Recipients: List of [Text];
        EmailScenario: Enum "Email Scenario";

    begin
        EmailItem."From Address" := 'rohan.garg@mindshell.info';
        EmailItem."Send to" := 'rohangrg110@gmail.com';
        EmailItem.Subject := 'Text';
        Customer.SetRange("No.", '10000');
        Recref.GetTable(Customer);

        EmailItem.Body.CreateOutStream(Outs);

        Recipients.Add('rohangrg110@gmail.com');
        // EmailMessage.CreateMessage(Recipients, 'test', 'Hi', false);
        EmailMessage.Run();
        /*Outs.WriteText('Hi');

        Outs.WriteText('Dear Sir,');
        Outs.WriteText('<table style="  font-family: arial, sans-serif; border-style: solid ;border-collapse: collapse;width: 100%; ">');
        Outs.WriteText('<tr  >');
        Outs.WriteText('<th style=" font-family: Lato-Bold;font-size: 12px; text-align: left; color: #fff;line-height: 1.8;background-color: #6c7ae0">Container No.</th>');
        Outs.WriteText('<th style=" font-family: Lato-Bold;font-size: 12px; text-align: left; color: #fff;line-height: 1.8;background-color: #6c7ae0">Size </th>');
        Outs.WriteText('</tr>');
        Outs.WriteText('<TR>');
        Outs.WriteText(' <th style=" font-size: 14px; border: 1px solid #dddddd;text-align: left;padding: 8px; font-size: 10px;"  >1000</th>');
        Outs.WriteText('<th style=" font-size: 14px; border: 1px solid #dddddd;text-align: left;padding: 8px; font-size: 10px;"  >chck</th>');
        Outs.WriteText('</TR>');
        Outs.WriteText('</table>');*/
        /*Outs.WriteText('<br><br>Please find the following  list of items whose inventory is greater than maximum quantity:<br><br>');
        Outs.WriteText('<table style="  font-family: arial, sans-serif;border-style: 1px solid;border-collapse: collapse;width: 100%; ">');

        //header start
        Outs.WriteText('  <tr  > ');
        Outs.WriteText('<th rowspan=2 style=" font-family: Lato-Bold;border: 1px solid #dddddd;font-size: 12px; text-align: center; color: #fff;line-height: 1.8;background-color: #6c7ae0">Item Code</th>');
        Outs.WriteText('<th rowspan=2 style=" font-family: Lato-Bold;border: 1px solid #dddddd;font-size: 12px; text-align: center; color: #fff;line-height: 1.8;background-color: #6c7ae0">Description </th>');
        Outs.WriteText('</tr>');



        // Body
        Outs.WriteText('  <tr  > ');
        Outs.WriteText('<th style=" font-size: 14px; border: 1px solid #dddddd;text-align: center;padding: 8px; font-size: 10px;"  >' + '1000' + '</th>');
        Outs.WriteText('<th style=" font-size: 14px; border: 1px solid #dddddd;text-align: center;padding: 8px; font-size: 10px;"  >' + 'test' + '</th>');
        Outs.WriteText('</tr>');
        Outs.WriteText('</table>');*/
        //Report.SaveAs(Report::"Customer - Top 10 List", '', ReportFormat::Pdf, Outs, Recref);
        //EmailItem.SetBodyText();
        //EmailItem.Send(true, EmailScenario::Default);

    end;
}
