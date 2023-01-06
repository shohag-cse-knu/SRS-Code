<?php

$access_token = "EAACnF2ypHUoBALsiwBZBhwwZCrHuGtAuAP1I0sfou4M9OHuXd00kNHfKWaTdSegILVhZA9vZAcGG21RXBEPMSp9PhH5S7zRZCyvzxS6LNoxvFnMKrUMARY4AsnZChwRR6Xg0ww9CEYTLBbS6N6dM6S3oCX0HWShyIbs9xv7XlkeQZDZD";
$verify_token = "my-secret-token";
$hub_verify_token = null;

if(isset($_REQUEST['hub_mode']) && $_REQUEST['hub_mode'] == 'subscribe')
{
	$challenge = $_REQUEST['hub_challenge'];
	$hub_verify_token = $_REQUEST['hub_verify_token'];
	if($hub_verify_token === $verify_token)
	{
		header('HTTP/1.1 200 OK');
		echo $challenge;
		die;
	}
}

$input = json_decode(file_get_contents('php://input'),true);
$sender = $input['entry'][0]['messaging'][0]['sender']['id'];
$message = isset($input['entry'][0]['messaging'][0]['message']['text'])? $input['entry'][0]['messaging'][0]['message']['text'] : '' ;

if($message){
	$message_to_reply = "This is the secret message send back to user";
	$url = "https://graph.facebook.com/v2.6/me/messages?access_token=".$access_token;
	$jsonData = '{
					"recipient": {
						"id": "'.$sender.'"
					},
					"message": {
						"text": "'.$message_to_reply.'"
					}
				}';
	$ch = curl_init($url);
	curl_setopt($ch,CURLOPT_POST,1);
	curl_setopt($ch,CURLOPT_POSTFIELDS,$jsonData);
	curl_setopt($ch,CURLOPT_HTTPHEADER,array('Content-Type: application/json'));
	curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
	$result = curl_exec($ch);
	curl_close($ch);
}

?>