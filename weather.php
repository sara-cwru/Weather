<H1> Check the Cleveland Weather <H1>
<H2> Enter the date you wish to get the weather for! <H2>

<?php
        echo "<form action='weather.php' method='GET'>";
        echo "<textarea cols=20 rows=1 name='date'> </textarea>";
        echo "<input type=submit>";
        echo "</form>";
        if (!empty($_GET["date"])) {
	        $date=$_GET['date'];
		shell_exec("echo $date > date.txt");
		$out_put = shell_exec('./weather.sh');
		echo "<p>$out_put</p>";
	}

?>
