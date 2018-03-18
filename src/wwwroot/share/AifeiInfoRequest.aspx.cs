using System;

public partial class share_AifeiInfoRequest : System.Web.UI.Page
{
    private string from = string.Empty;
    private string to = string.Empty;
    private string airline = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        from = Request.QueryString["from"];
        to = Request.QueryString["to"];
        airline = Request.QueryString["airline"];

        AiFeiService afs = new AiFeiService();
        FeiYingFlight flight = afs.getFlightMsg2(from, to, airline, string.Empty);	
		//没有数据
		if (flight==null)
		{
			Response.Write("false");
			Response.End();
			return;
		}
			
		Response.Write(flight.airplan);
		Response.End();
    }
}
