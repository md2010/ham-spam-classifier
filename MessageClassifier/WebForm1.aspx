<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MessageClassifier.WebForm1" %>


<!DOCTYPE html>

<html lang="en">

<head runat="server">
	<title>spam checker</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="design.css" />
</head>

<body>
	<div CssClass="spam-checker-container">
		<div class="form-container">
			<form class="form" runat="server">
				<span class="form-title">
					Spam checker
				</span>
				<div class="form-input-container">
					<span class="message">Message:</span>
					<asp:TextBox type="text" CssClass="message-input" ID="message" runat="server" placeholder="Enter your message here..."></asp:TextBox>
					<span class="focus-message-input"></span>
				</div>

				<div CssClass="form-button-container">

					<button CssClass="form-button">
						<span>
							<asp:LinkButton CssClass="form-button" ID="button" Font-Underline="false" runat="server" OnClick="button_Click">Check</asp:LinkButton>
						</span>
					</button>					
						
					<button CssClass="form-button">
						<span>
							<asp:LinkButton CssClass="form-button" ID="button1" Font-Underline="false" runat="server" OnClick="button1_Click">View Examples</asp:LinkButton>
						</span>
					</button>						
										
				</div>
			</form>
			
			<div CssClass="result-message">
				<asp:label ID="lblResults" runat="server" Text="" CssClass="result-message"></asp:label>
			</div>
			
			<br><br>

			<asp:Panel CssClass="form-input-container" runat="server">
				<div id="examples" Visible="false" runat="server">
					<asp:label CssClass="message-input" ID="message1" runat="server" Text=""></asp:label>
					
					<asp:label CssClass="message-input" ID="result1" runat="server" Text="HAM"></asp:label>
					<br>
					<asp:label CssClass="message-input" ID="message2" runat="server" Text=""></asp:label>
					
					<asp:label CssClass="message-input" ID="result2" runat="server" Text="SPAM"></asp:label>
				</div>
			</asp:Panel>
			
		</div>
	</div>
</body>
</html>
