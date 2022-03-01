<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MessageClassifier.WebForm1" %>


<!DOCTYPE html>

<html lang="en">

<head runat="server">
	<title>sapm checker</title>
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
				</div>
			</form>
			
			<div CssClass="result-message">
				<asp:label ID="lblResults" runat="server" Text=""></asp:label>
			</div>
			
			
		</div>
	</div>
</body>
</html>
