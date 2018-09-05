function auto_send_reminder()
{
	$url = base_url().'index.php/send_reminder/send_reminder_data';
	$query = $this->db->query("SELECT id,CODE FROM reminder_clock_type")->result();
	if(count($query) > 0)
	{
		$ch = curl_init( $url );
		foreach ($query as $result) {
			$myvars = 'id=' . $result->id . '&code=' . $result->code;
			curl_setopt( $ch, CURLOPT_POST, 1);
			curl_setopt( $ch, CURLOPT_POSTFIELDS, $myvars);
			curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
			curl_setopt( $ch, CURLOPT_HEADER, 0);
			curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);
			$response = curl_exec( $ch );
		}
		curl_close($ch);
	}
}