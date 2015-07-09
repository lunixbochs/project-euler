<?php
$a = 0;
$b = 1;
$total = 0;
while ($b < 4000000) {
    if ($b % 2 == 0) {
        $total += $b;
    }
    $tmp = $a;
    $a = $b;
    $b += $tmp;
}
print "$total\n";
?>
