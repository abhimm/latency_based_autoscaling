<!DOCTYPE html>
<html>
<body>
<?php
	$msg = "This test page generates 500 random no";

	echo $msg;
	for($counter = 0; $counter < 500; $counter++)
	{
		$rand_no = rand();
		echo "$rand_no <br>" ;
		
	}
?>

</body>
</html>
