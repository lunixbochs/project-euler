<?php
$sum = 0;
for ($i = 0; $i < 1000; $i++) {
    if ($i % 5 == 0 || $i % 3 == 0) {
        $sum += $i;
    }
}
print "$sum\n";
?>
