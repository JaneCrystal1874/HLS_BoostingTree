-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bkb_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 12; 
             MEM_SIZE    : integer := 3136
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bkb_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 => "0", 3 => "1", 4 to 5=> "0", 6 => "1", 7 to 10=> "0", 
    11 => "1", 12 => "0", 13 to 15=> "1", 16 to 17=> "0", 18 to 19=> "1", 20 to 24=> "0", 25 to 26=> "1", 
    27 => "0", 28 => "1", 29 => "0", 30 to 31=> "1", 32 => "0", 33 => "1", 34 to 35=> "0", 
    36 => "1", 37 to 38=> "0", 39 => "1", 40 => "0", 41 => "1", 42 => "0", 43 => "1", 
    44 => "0", 45 => "1", 46 to 47=> "0", 48 => "1", 49 => "0", 50 to 51=> "1", 52 => "0", 
    53 to 54=> "1", 55 to 56=> "0", 57 to 59=> "1", 60 => "0", 61 to 63=> "1", 64 => "0", 65 => "1", 
    66 => "0", 67 to 68=> "1", 69 to 71=> "0", 72 to 73=> "1", 74 => "0", 75 => "1", 76 => "0", 
    77 => "1", 78 => "0", 79 => "1", 80 to 82=> "0", 83 to 85=> "1", 86 to 88=> "0", 89 to 91=> "1", 
    92 => "0", 93 => "1", 94 => "0", 95 to 96=> "1", 97 => "0", 98 => "1", 99 to 102=> "0", 
    103 to 104=> "1", 105 to 106=> "0", 107 to 111=> "1", 112 to 113=> "0", 114 => "1", 115 to 116=> "0", 117 to 119=> "1", 
    120 to 121=> "0", 122 => "1", 123 to 128=> "0", 129 => "1", 130 => "0", 131 to 134=> "1", 135 => "0", 
    136 to 139=> "1", 140 to 145=> "0", 146 to 148=> "1", 149 => "0", 150 => "1", 151 to 152=> "0", 153 => "1", 
    154 => "0", 155 => "1", 156 to 157=> "0", 158 => "1", 159 => "0", 160 => "1", 161 => "0", 
    162 to 165=> "1", 166 => "0", 167 => "1", 168 to 169=> "0", 170 to 171=> "1", 172 to 173=> "0", 174 => "1", 
    175 => "0", 176 => "1", 177 => "0", 178 to 182=> "1", 183 to 196=> "0", 197 => "1", 198 to 200=> "0", 
    201 to 202=> "1", 203 to 204=> "0", 205 to 207=> "1", 208 to 209=> "0", 210 => "1", 211 => "0", 212 to 213=> "1", 
    214 => "0", 215 => "1", 216 => "0", 217 => "1", 218 => "0", 219 => "1", 220 to 223=> "0", 
    224 to 225=> "1", 226 => "0", 227 => "1", 228 => "0", 229 => "1", 230 to 231=> "0", 232 => "1", 
    233 to 234=> "0", 235 => "1", 236 to 237=> "0", 238 to 239=> "1", 240 => "0", 241 => "1", 242 => "0", 
    243 to 244=> "1", 245 to 246=> "0", 247 => "1", 248 to 250=> "0", 251 => "1", 252 => "0", 253 => "1", 
    254 => "0", 255 => "1", 256 => "0", 257 => "1", 258 to 259=> "0", 260 to 261=> "1", 262 => "0", 
    263 to 265=> "1", 266 to 267=> "0", 268 => "1", 269 to 271=> "0", 272 to 273=> "1", 274 => "0", 275 => "1", 
    276 => "0", 277 => "1", 278 => "0", 279 => "1", 280 => "0", 281 to 283=> "1", 284 => "0", 
    285 to 286=> "1", 287 to 288=> "0", 289 => "1", 290 => "0", 291 to 295=> "1", 296 => "0", 297 => "1", 
    298 to 299=> "0", 300 => "1", 301 => "0", 302 to 303=> "1", 304 => "0", 305 => "1", 306 => "0", 
    307 => "1", 308 to 310=> "0", 311 to 313=> "1", 314 to 315=> "0", 316 => "1", 317 => "0", 318 => "1", 
    319 => "0", 320 => "1", 321 => "0", 322 => "1", 323 to 325=> "0", 326 to 328=> "1", 329 to 331=> "0", 
    332 => "1", 333 => "0", 334 to 336=> "1", 337 to 338=> "0", 339 => "1", 340 => "0", 341 => "1", 
    342 => "0", 343 => "1", 344 to 349=> "0", 350 => "1", 351 => "0", 352 to 354=> "1", 355 to 357=> "0", 
    358 to 360=> "1", 361 => "0", 362 to 365=> "1", 366 to 367=> "0", 368 to 372=> "1", 373 to 393=> "0", 394 => "1", 
    395 to 398=> "0", 399 => "1", 400 => "0", 401 => "1", 402 => "0", 403 => "1", 404 => "0", 
    405 => "1", 406 to 408=> "0", 409 to 411=> "1", 412 to 413=> "0", 414 => "1", 415 => "0", 416 to 418=> "1", 
    419 => "0", 420 to 421=> "1", 422 => "0", 423 => "1", 424 to 427=> "0", 428 => "1", 429 => "0", 
    430 to 431=> "1", 432 to 435=> "0", 436 to 437=> "1", 438 => "0", 439 => "1", 440 to 441=> "0", 442 to 443=> "1", 
    444 => "0", 445 => "1", 446 => "0", 447 to 451=> "1", 452 => "0", 453 => "1", 454 to 456=> "0", 
    457 => "1", 458 to 459=> "0", 460 to 461=> "1", 462 to 464=> "0", 465 to 467=> "1", 468 => "0", 469 to 470=> "1", 
    471 to 473=> "0", 474 to 476=> "1", 477 to 481=> "0", 482 => "1", 483 => "0", 484 => "1", 485 => "0", 
    486 to 488=> "1", 489 => "0", 490 => "1", 491 to 493=> "0", 494 to 497=> "1", 498 => "0", 499 to 500=> "1", 
    501 => "0", 502 to 503=> "1", 504 to 508=> "0", 509 to 510=> "1", 511 to 512=> "0", 513 to 515=> "1", 516 => "0", 
    517 to 520=> "1", 521 => "0", 522 to 523=> "1", 524 => "0", 525 => "1", 526 to 528=> "0", 529 to 531=> "1", 
    532 => "0", 533 => "1", 534 to 538=> "0", 539 to 540=> "1", 541 => "0", 542 to 544=> "1", 545 => "0", 
    546 => "1", 547 => "0", 548 => "1", 549 => "0", 550 => "1", 551 => "0", 552 to 553=> "1", 
    554 to 557=> "0", 558 to 560=> "1", 561 => "0", 562 to 564=> "1", 565 to 588=> "0", 589 => "1", 590 to 592=> "0", 
    593 => "1", 594 to 597=> "0", 598 => "1", 599 => "0", 600 to 601=> "1", 602 => "0", 603 to 604=> "1", 
    605 => "0", 606 to 609=> "1", 610 => "0", 611 => "1", 612 to 613=> "0", 614 => "1", 615 to 619=> "0", 
    620 to 621=> "1", 622 to 624=> "0", 625 to 630=> "1", 631 to 633=> "0", 634 to 635=> "1", 636 to 638=> "0", 639 to 641=> "1", 
    642 => "0", 643 => "1", 644 => "0", 645 => "1", 646 to 647=> "0", 648 => "1", 649 to 653=> "0", 
    654 to 656=> "1", 657 to 658=> "0", 659 to 660=> "1", 661 => "0", 662 to 663=> "1", 664 => "0", 665 to 667=> "1", 
    668 to 669=> "0", 670 to 671=> "1", 672 => "0", 673 => "1", 674 => "0", 675 => "1", 676 => "0", 
    677 => "1", 678 => "0", 679 => "1", 680 => "0", 681 to 682=> "1", 683 => "0", 684 => "1", 
    685 => "0", 686 => "1", 687 => "0", 688 to 689=> "1", 690 to 692=> "0", 693 to 695=> "1", 696 => "0", 
    697 => "1", 698 to 699=> "0", 700 => "1", 701 => "0", 702 => "1", 703 to 707=> "0", 708 => "1", 
    709 to 710=> "0", 711 => "1", 712 to 713=> "0", 714 => "1", 715 => "0", 716 => "1", 717 => "0", 
    718 to 720=> "1", 721 => "0", 722 to 725=> "1", 726 to 728=> "0", 729 to 730=> "1", 731 to 732=> "0", 733 => "1", 
    734 => "0", 735 to 736=> "1", 737 to 739=> "0", 740 to 743=> "1", 744 => "0", 745 => "1", 746 to 747=> "0", 
    748 to 750=> "1", 751 => "0", 752 => "1", 753 => "0", 754 => "1", 755 to 757=> "0", 758 to 762=> "1", 
    763 to 784=> "0", 785 => "1", 786 to 788=> "0", 789 to 790=> "1", 791 => "0", 792 => "1", 793 => "0", 
    794 => "1", 795 to 801=> "0", 802 to 804=> "1", 805 to 806=> "0", 807 to 812=> "1", 813 to 814=> "0", 815 => "1", 
    816 => "0", 817 => "1", 818 => "0", 819 to 820=> "1", 821 to 822=> "0", 823 => "1", 824 => "0", 
    825 => "1", 826 to 829=> "0", 830 to 831=> "1", 832 => "0", 833 to 834=> "1", 835 to 840=> "0", 841 to 847=> "1", 
    848 => "0", 849 => "1", 850 => "0", 851 to 852=> "1", 853 to 854=> "0", 855 => "1", 856 => "0", 
    857 => "1", 858 => "0", 859 => "1", 860 => "0", 861 => "1", 862 to 864=> "0", 865 => "1", 
    866 => "0", 867 to 868=> "1", 869 => "0", 870 => "1", 871 to 872=> "0", 873 => "1", 874 => "0", 
    875 => "1", 876 to 877=> "0", 878 to 882=> "1", 883 to 885=> "0", 886 to 889=> "1", 890 => "0", 891 => "1", 
    892 => "0", 893 => "1", 894 => "0", 895 => "1", 896 => "0", 897 => "1", 898 to 901=> "0", 
    902 to 903=> "1", 904 => "0", 905 => "1", 906 => "0", 907 to 909=> "1", 910 to 912=> "0", 913 to 914=> "1", 
    915 to 917=> "0", 918 => "1", 919 to 920=> "0", 921 to 922=> "1", 923 => "0", 924 => "1", 925 => "0", 
    926 to 928=> "1", 929 to 930=> "0", 931 to 932=> "1", 933 to 935=> "0", 936 to 937=> "1", 938 => "0", 939 to 940=> "1", 
    941 => "0", 942 => "1", 943 to 944=> "0", 945 => "1", 946 => "0", 947 to 948=> "1", 949 to 950=> "0", 
    951 to 954=> "1", 955 to 982=> "0", 983 => "1", 984 to 985=> "0", 986 => "1", 987 => "0", 988 to 989=> "1", 
    990 => "0", 991 => "1", 992 to 996=> "0", 997 to 1003=> "1", 1004 => "0", 1005 => "1", 1006 => "0", 
    1007 => "1", 1008 to 1009=> "0", 1010 to 1011=> "1", 1012 => "0", 1013 => "1", 1014 => "0", 1015 => "1", 
    1016 to 1019=> "0", 1020 to 1021=> "1", 1022 to 1024=> "0", 1025 to 1029=> "1", 1030 to 1031=> "0", 1032 to 1033=> "1", 1034 to 1038=> "0", 
    1039 to 1040=> "1", 1041 => "0", 1042 to 1045=> "1", 1046 to 1048=> "0", 1049 to 1050=> "1", 1051 to 1053=> "0", 1054 => "1", 
    1055 => "0", 1056 => "1", 1057 => "0", 1058 => "1", 1059 => "0", 1060 => "1", 1061 to 1063=> "0", 
    1064 to 1069=> "1", 1070 to 1076=> "0", 1077 to 1079=> "1", 1080 to 1081=> "0", 1082 to 1083=> "1", 1084 => "0", 1085 to 1087=> "1", 
    1088 to 1090=> "0", 1091 => "1", 1092 => "0", 1093 to 1094=> "1", 1095 => "0", 1096 to 1098=> "1", 1099 to 1101=> "0", 
    1102 => "1", 1103 => "0", 1104 to 1107=> "1", 1108 => "0", 1109 => "1", 1110 to 1114=> "0", 1115 => "1", 
    1116 => "0", 1117 to 1120=> "1", 1121 to 1122=> "0", 1123 to 1124=> "1", 1125 to 1126=> "0", 1127 => "1", 1128 to 1129=> "0", 
    1130 => "1", 1131 => "0", 1132 to 1134=> "1", 1135 to 1136=> "0", 1137 to 1139=> "1", 1140 => "0", 1141 => "1", 
    1142 => "0", 1143 => "1", 1144 => "0", 1145 to 1146=> "1", 1147 to 1176=> "0", 1177 => "1", 1178 to 1180=> "0", 
    1181 => "1", 1182 to 1183=> "0", 1184 => "1", 1185 => "0", 1186 => "1", 1187 to 1188=> "0", 1189 => "1", 
    1190 => "0", 1191 => "1", 1192 to 1193=> "0", 1194 => "1", 1195 => "0", 1196 to 1197=> "1", 1198 => "0", 
    1199 to 1200=> "1", 1201 to 1203=> "0", 1204 => "1", 1205 => "0", 1206 => "1", 1207 to 1208=> "0", 1209 => "1", 
    1210 => "0", 1211 to 1215=> "1", 1216 => "0", 1217 => "1", 1218 => "0", 1219 to 1221=> "1", 1222 => "0", 
    1223 => "1", 1224 to 1227=> "0", 1228 to 1229=> "1", 1230 to 1231=> "0", 1232 to 1233=> "1", 1234 => "0", 1235 to 1236=> "1", 
    1237 to 1239=> "0", 1240 to 1241=> "1", 1242 to 1243=> "0", 1244 to 1246=> "1", 1247 => "0", 1248 => "1", 1249 to 1250=> "0", 
    1251 to 1253=> "1", 1254 to 1261=> "0", 1262 => "1", 1263 => "0", 1264 => "1", 1265 => "0", 1266 => "1", 
    1267 => "0", 1268 to 1270=> "1", 1271 => "0", 1272 to 1274=> "1", 1275 => "0", 1276 => "1", 1277 => "0", 
    1278 to 1279=> "1", 1280 => "0", 1281 to 1282=> "1", 1283 to 1285=> "0", 1286 => "1", 1287 => "0", 1288 to 1289=> "1", 
    1290 to 1292=> "0", 1293 => "1", 1294 to 1295=> "0", 1296 to 1298=> "1", 1299 to 1300=> "0", 1301 to 1304=> "1", 1305 => "0", 
    1306 => "1", 1307 => "0", 1308 to 1309=> "1", 1310 to 1312=> "0", 1313 => "1", 1314 to 1316=> "0", 1317 => "1", 
    1318 => "0", 1319 to 1321=> "1", 1322 to 1325=> "0", 1326 to 1328=> "1", 1329 => "0", 1330 => "1", 1331 => "0", 
    1332 => "1", 1333 => "0", 1334 to 1337=> "1", 1338 => "0", 1339 to 1340=> "1", 1341 to 1374=> "0", 1375 => "1", 
    1376 => "0", 1377 to 1378=> "1", 1379 to 1381=> "0", 1382 => "1", 1383 => "0", 1384 to 1385=> "1", 1386 to 1387=> "0", 
    1388 => "1", 1389 to 1393=> "0", 1394 => "1", 1395 to 1396=> "0", 1397 => "1", 1398 to 1401=> "0", 1402 => "1", 
    1403 to 1407=> "0", 1408 => "1", 1409 to 1413=> "0", 1414 => "1", 1415 => "0", 1416 to 1418=> "1", 1419 => "0", 
    1420 => "1", 1421 => "0", 1422 => "1", 1423 to 1424=> "0", 1425 to 1429=> "1", 1430 => "0", 1431 => "1", 
    1432 => "0", 1433 to 1441=> "1", 1442 to 1445=> "0", 1446 to 1447=> "1", 1448 to 1450=> "0", 1451 to 1453=> "1", 1454 to 1456=> "0", 
    1457 => "1", 1458 => "0", 1459 to 1461=> "1", 1462 => "0", 1463 to 1464=> "1", 1465 => "0", 1466 => "1", 
    1467 to 1470=> "0", 1471 to 1472=> "1", 1473 to 1474=> "0", 1475 => "1", 1476 => "0", 1477 => "1", 1478 => "0", 
    1479 to 1481=> "1", 1482 to 1483=> "0", 1484 => "1", 1485 => "0", 1486 to 1488=> "1", 1489 to 1495=> "0", 1496 to 1498=> "1", 
    1499 to 1501=> "0", 1502 => "1", 1503 => "0", 1504 => "1", 1505 to 1507=> "0", 1508 to 1509=> "1", 1510 => "0", 
    1511 to 1513=> "1", 1514 => "0", 1515 => "1", 1516 => "0", 1517 => "1", 1518 => "0", 1519 to 1521=> "1", 
    1522 => "0", 1523 to 1525=> "1", 1526 => "0", 1527 => "1", 1528 to 1529=> "0", 1530 => "1", 1531 => "0", 
    1532 => "1", 1533 to 1534=> "0", 1535 => "1", 1536 => "0", 1537 to 1542=> "1", 1543 => "0", 1544 => "1", 
    1545 => "0", 1546 => "1", 1547 => "0", 1548 to 1549=> "1", 1550 to 1551=> "0", 1552 to 1558=> "1", 1559 to 1569=> "0", 
    1570 to 1571=> "1", 1572 => "0", 1573 => "1", 1574 => "0", 1575 => "1", 1576 to 1577=> "0", 1578 => "1", 
    1579 to 1582=> "0", 1583 to 1587=> "1", 1588 to 1591=> "0", 1592 to 1593=> "1", 1594 => "0", 1595 => "1", 1596 to 1599=> "0", 
    1600 to 1603=> "1", 1604 => "0", 1605 => "1", 1606 => "0", 1607 => "1", 1608 => "0", 1609 => "1", 
    1610 to 1613=> "0", 1614 => "1", 1615 => "0", 1616 => "1", 1617 to 1618=> "0", 1619 => "1", 1620 => "0", 
    1621 to 1623=> "1", 1624 => "0", 1625 to 1626=> "1", 1627 => "0", 1628 to 1629=> "1", 1630 => "0", 1631 to 1632=> "1", 
    1633 => "0", 1634 => "1", 1635 => "0", 1636 => "1", 1637 => "0", 1638 => "1", 1639 to 1641=> "0", 
    1642 to 1645=> "1", 1646 to 1649=> "0", 1650 => "1", 1651 => "0", 1652 to 1653=> "1", 1654 => "0", 1655 => "1", 
    1656 to 1657=> "0", 1658 => "1", 1659 to 1662=> "0", 1663 => "1", 1664 => "0", 1665 => "1", 1666 to 1671=> "0", 
    1672 to 1673=> "1", 1674 => "0", 1675 to 1678=> "1", 1679 => "0", 1680 => "1", 1681 to 1682=> "0", 1683 to 1684=> "1", 
    1685 to 1686=> "0", 1687 to 1688=> "1", 1689 => "0", 1690 to 1692=> "1", 1693 => "0", 1694 to 1697=> "1", 1698 to 1699=> "0", 
    1700 => "1", 1701 => "0", 1702 => "1", 1703 => "0", 1704 => "1", 1705 to 1707=> "0", 1708 => "1", 
    1709 to 1710=> "0", 1711 to 1714=> "1", 1715 => "0", 1716 to 1718=> "1", 1719 to 1720=> "0", 1721 to 1723=> "1", 1724 to 1726=> "0", 
    1727 => "1", 1728 => "0", 1729 => "1", 1730 => "0", 1731 to 1734=> "1", 1735 to 1767=> "0", 1768 => "1", 
    1769 => "0", 1770 => "1", 1771 => "0", 1772 => "1", 1773 => "0", 1774 to 1775=> "1", 1776 to 1779=> "0", 
    1780 to 1785=> "1", 1786 to 1787=> "0", 1788 to 1789=> "1", 1790 to 1791=> "0", 1792 to 1793=> "1", 1794 to 1796=> "0", 1797 => "1", 
    1798 to 1801=> "0", 1802 => "1", 1803 => "0", 1804 => "1", 1805 => "0", 1806 to 1808=> "1", 1809 to 1810=> "0", 
    1811 to 1812=> "1", 1813 to 1815=> "0", 1816 => "1", 1817 => "0", 1818 to 1821=> "1", 1822 => "0", 1823 => "1", 
    1824 to 1826=> "0", 1827 => "1", 1828 to 1829=> "0", 1830 to 1831=> "1", 1832 => "0", 1833 => "1", 1834 to 1836=> "0", 
    1837 to 1839=> "1", 1840 => "0", 1841 to 1844=> "1", 1845 => "0", 1846 to 1847=> "1", 1848 to 1850=> "0", 1851 => "1", 
    1852 => "0", 1853 => "1", 1854 to 1855=> "0", 1856 to 1858=> "1", 1859 to 1860=> "0", 1861 => "1", 1862 => "0", 
    1863 => "1", 1864 to 1865=> "0", 1866 => "1", 1867 to 1868=> "0", 1869 to 1873=> "1", 1874 => "0", 1875 => "1", 
    1876 to 1878=> "0", 1879 to 1880=> "1", 1881 => "0", 1882 => "1", 1883 => "0", 1884 => "1", 1885 to 1886=> "0", 
    1887 => "1", 1888 to 1890=> "0", 1891 to 1892=> "1", 1893 to 1896=> "0", 1897 to 1899=> "1", 1900 to 1903=> "0", 1904 to 1910=> "1", 
    1911 => "0", 1912 => "1", 1913 => "0", 1914 => "1", 1915 to 1916=> "0", 1917 => "1", 1918 to 1919=> "0", 
    1920 to 1921=> "1", 1922 to 1923=> "0", 1924 to 1925=> "1", 1926 => "0", 1927 to 1930=> "1", 1931 to 1960=> "0", 1961 => "1", 
    1962 to 1965=> "0", 1966 => "1", 1967 => "0", 1968 => "1", 1969 => "0", 1970 => "1", 1971 => "0", 
    1972 => "1", 1973 => "0", 1974 => "1", 1975 => "0", 1976 => "1", 1977 to 1978=> "0", 1979 to 1983=> "1", 
    1984 => "0", 1985 => "1", 1986 => "0", 1987 => "1", 1988 to 1989=> "0", 1990 to 1991=> "1", 1992 to 1999=> "0", 
    2000 => "1", 2001 => "0", 2002 to 2006=> "1", 2007 => "0", 2008 to 2010=> "1", 2011 to 2013=> "0", 2014 to 2017=> "1", 
    2018 => "0", 2019 => "1", 2020 to 2022=> "0", 2023 to 2025=> "1", 2026 to 2028=> "0", 2029 => "1", 2030 => "0", 
    2031 => "1", 2032 to 2034=> "0", 2035 => "1", 2036 to 2038=> "0", 2039 to 2041=> "1", 2042 to 2043=> "0", 2044 to 2046=> "1", 
    2047 => "0", 2048 => "1", 2049 to 2050=> "0", 2051 => "1", 2052 => "0", 2053 => "1", 2054 to 2055=> "0", 
    2056 to 2057=> "1", 2058 => "0", 2059 => "1", 2060 to 2061=> "0", 2062 to 2063=> "1", 2064 => "0", 2065 => "1", 
    2066 to 2067=> "0", 2068 to 2069=> "1", 2070 to 2072=> "0", 2073 to 2075=> "1", 2076 to 2081=> "0", 2082 to 2083=> "1", 2084 => "0", 
    2085 to 2089=> "1", 2090 to 2091=> "0", 2092 to 2095=> "1", 2096 => "0", 2097 => "1", 2098 to 2101=> "0", 2102 => "1", 
    2103 => "0", 2104 to 2106=> "1", 2107 to 2108=> "0", 2109 => "1", 2110 => "0", 2111 to 2112=> "1", 2113 to 2115=> "0", 
    2116 => "1", 2117 to 2118=> "0", 2119 to 2122=> "1", 2123 to 2125=> "0", 2126 => "1", 2127 => "0", 2128 to 2130=> "1", 
    2131 to 2132=> "0", 2133 to 2138=> "1", 2139 to 2157=> "0", 2158 => "1", 2159 to 2162=> "0", 2163 => "1", 2164 to 2165=> "0", 
    2166 to 2167=> "1", 2168 to 2169=> "0", 2170 to 2171=> "1", 2172 to 2173=> "0", 2174 => "1", 2175 => "0", 2176 to 2177=> "1", 
    2178 => "0", 2179 to 2180=> "1", 2181 to 2185=> "0", 2186 to 2187=> "1", 2188 => "0", 2189 to 2191=> "1", 2192 => "0", 
    2193 => "1", 2194 to 2195=> "0", 2196 to 2199=> "1", 2200 => "0", 2201 => "1", 2202 => "0", 2203 => "1", 
    2204 to 2205=> "0", 2206 => "1", 2207 => "0", 2208 to 2209=> "1", 2210 => "0", 2211 => "1", 2212 to 2214=> "0", 
    2215 => "1", 2216 => "0", 2217 => "1", 2218 => "0", 2219 => "1", 2220 => "0", 2221 => "1", 
    2222 to 2223=> "0", 2224 to 2225=> "1", 2226 => "0", 2227 => "1", 2228 to 2230=> "0", 2231 to 2232=> "1", 2233 => "0", 
    2234 to 2237=> "1", 2238 => "0", 2239 to 2241=> "1", 2242 => "0", 2243 => "1", 2244 => "0", 2245 => "1", 
    2246 => "0", 2247 => "1", 2248 to 2249=> "0", 2250 => "1", 2251 => "0", 2252 => "1", 2253 to 2254=> "0", 
    2255 => "1", 2256 to 2259=> "0", 2260 => "1", 2261 => "0", 2262 to 2266=> "1", 2267 => "0", 2268 => "1", 
    2269 => "0", 2270 to 2271=> "1", 2272 to 2274=> "0", 2275 to 2276=> "1", 2277 to 2279=> "0", 2280 => "1", 2281 => "0", 
    2282 to 2283=> "1", 2284 to 2286=> "0", 2287 => "1", 2288 => "0", 2289 => "1", 2290 => "0", 2291 => "1", 
    2292 => "0", 2293 => "1", 2294 => "0", 2295 to 2299=> "1", 2300 to 2304=> "0", 2305 to 2306=> "1", 2307 => "0", 
    2308 => "1", 2309 => "0", 2310 => "1", 2311 to 2312=> "0", 2313 to 2314=> "1", 2315 => "0", 2316 to 2318=> "1", 
    2319 => "0", 2320 => "1", 2321 => "0", 2322 => "1", 2323 => "0", 2324 to 2326=> "1", 2327 to 2353=> "0", 
    2354 => "1", 2355 to 2357=> "0", 2358 => "1", 2359 => "0", 2360 => "1", 2361 to 2362=> "0", 2363 => "1", 
    2364 to 2365=> "0", 2366 => "1", 2367 to 2369=> "0", 2370 to 2371=> "1", 2372 to 2373=> "0", 2374 to 2375=> "1", 2376 to 2377=> "0", 
    2378 to 2379=> "1", 2380 => "0", 2381 to 2382=> "1", 2383 => "0", 2384 to 2386=> "1", 2387 => "0", 2388 => "1", 
    2389 => "0", 2390 => "1", 2391 => "0", 2392 => "1", 2393 => "0", 2394 to 2395=> "1", 2396 => "0", 
    2397 => "1", 2398 to 2400=> "0", 2401 => "1", 2402 => "0", 2403 to 2407=> "1", 2408 => "0", 2409 => "1", 
    2410 to 2411=> "0", 2412 => "1", 2413 to 2415=> "0", 2416 to 2417=> "1", 2418 to 2424=> "0", 2425 to 2428=> "1", 2429 to 2430=> "0", 
    2431 => "1", 2432 to 2434=> "0", 2435 to 2436=> "1", 2437 => "0", 2438 to 2440=> "1", 2441 => "0", 2442 to 2444=> "1", 
    2445 => "0", 2446 to 2447=> "1", 2448 to 2451=> "0", 2452 => "1", 2453 => "0", 2454 => "1", 2455 => "0", 
    2456 => "1", 2457 to 2459=> "0", 2460 to 2464=> "1", 2465 => "0", 2466 => "1", 2467 => "0", 2468 to 2470=> "1", 
    2471 to 2473=> "0", 2474 => "1", 2475 => "0", 2476 to 2477=> "1", 2478 to 2479=> "0", 2480 => "1", 2481 to 2484=> "0", 
    2485 => "1", 2486 => "0", 2487 => "1", 2488 => "0", 2489 => "1", 2490 => "0", 2491 => "1", 
    2492 => "0", 2493 to 2497=> "1", 2498 to 2499=> "0", 2500 => "1", 2501 => "0", 2502 => "1", 2503 => "0", 
    2504 => "1", 2505 => "0", 2506 => "1", 2507 to 2509=> "0", 2510 to 2514=> "1", 2515 to 2517=> "0", 2518 to 2520=> "1", 
    2521 => "0", 2522 => "1", 2523 to 2524=> "0", 2525 to 2528=> "1", 2529 to 2552=> "0", 2553 => "1", 2554 to 2555=> "0", 
    2556 => "1", 2557 => "0", 2558 => "1", 2559 => "0", 2560 to 2564=> "1", 2565 to 2567=> "0", 2568 => "1", 
    2569 to 2570=> "0", 2571 to 2572=> "1", 2573 to 2576=> "0", 2577 => "1", 2578 => "0", 2579 => "1", 2580 to 2582=> "0", 
    2583 => "1", 2584 to 2585=> "0", 2586 to 2589=> "1", 2590 => "0", 2591 to 2592=> "1", 2593 => "0", 2594 to 2597=> "1", 
    2598 to 2602=> "0", 2603 to 2604=> "1", 2605 to 2609=> "0", 2610 => "1", 2611 => "0", 2612 to 2613=> "1", 2614 to 2615=> "0", 
    2616 => "1", 2617 => "0", 2618 to 2621=> "1", 2622 to 2625=> "0", 2626 => "1", 2627 => "0", 2628 to 2632=> "1", 
    2633 to 2636=> "0", 2637 => "1", 2638 to 2643=> "0", 2644 to 2649=> "1", 2650 => "0", 2651 to 2655=> "1", 2656 => "0", 
    2657 => "1", 2658 to 2660=> "0", 2661 to 2662=> "1", 2663 to 2664=> "0", 2665 to 2666=> "1", 2667 to 2668=> "0", 2669 to 2671=> "1", 
    2672 => "0", 2673 => "1", 2674 to 2678=> "0", 2679 to 2681=> "1", 2682 to 2685=> "0", 2686 => "1", 2687 to 2688=> "0", 
    2689 to 2691=> "1", 2692 => "0", 2693 => "1", 2694 to 2697=> "0", 2698 => "1", 2699 => "0", 2700 => "1", 
    2701 to 2702=> "0", 2703 => "1", 2704 => "0", 2705 to 2707=> "1", 2708 => "0", 2709 to 2711=> "1", 2712 to 2713=> "0", 
    2714 to 2719=> "1", 2720 => "0", 2721 to 2726=> "1", 2727 to 2747=> "0", 2748 => "1", 2749 to 2752=> "0", 2753 to 2755=> "1", 
    2756 to 2757=> "0", 2758 => "1", 2759 to 2760=> "0", 2761 => "1", 2762 to 2763=> "0", 2764 => "1", 2765 to 2766=> "0", 
    2767 => "1", 2768 to 2769=> "0", 2770 => "1", 2771 => "0", 2772 => "1", 2773 => "0", 2774 => "1", 
    2775 to 2783=> "0", 2784 to 2787=> "1", 2788 => "0", 2789 => "1", 2790 => "0", 2791 => "1", 2792 to 2796=> "0", 
    2797 => "1", 2798 to 2799=> "0", 2800 => "1", 2801 to 2802=> "0", 2803 to 2804=> "1", 2805 to 2809=> "0", 2810 to 2814=> "1", 
    2815 => "0", 2816 => "1", 2817 to 2818=> "0", 2819 to 2820=> "1", 2821 => "0", 2822 to 2827=> "1", 2828 to 2830=> "0", 
    2831 => "1", 2832 to 2833=> "0", 2834 => "1", 2835 => "0", 2836 to 2837=> "1", 2838 to 2840=> "0", 2841 => "1", 
    2842 => "0", 2843 to 2848=> "1", 2849 to 2850=> "0", 2851 to 2852=> "1", 2853 to 2854=> "0", 2855 to 2857=> "1", 2858 to 2860=> "0", 
    2861 to 2865=> "1", 2866 to 2868=> "0", 2869 => "1", 2870 to 2871=> "0", 2872 to 2877=> "1", 2878 => "0", 2879 to 2880=> "1", 
    2881 => "0", 2882 to 2883=> "1", 2884 to 2886=> "0", 2887 to 2892=> "1", 2893 => "0", 2894 => "1", 2895 => "0", 
    2896 to 2898=> "1", 2899 => "0", 2900 => "1", 2901 to 2903=> "0", 2904 to 2905=> "1", 2906 to 2908=> "0", 2909 to 2910=> "1", 
    2911 to 2912=> "0", 2913 to 2915=> "1", 2916 => "0", 2917 => "1", 2918 => "0", 2919 to 2922=> "1", 2923 to 2943=> "0", 
    2944 => "1", 2945 => "0", 2946 to 2947=> "1", 2948 to 2950=> "0", 2951 to 2953=> "1", 2954 to 2956=> "0", 2957 => "1", 
    2958 => "0", 2959 to 2960=> "1", 2961 to 2962=> "0", 2963 => "1", 2964 => "0", 2965 => "1", 2966 => "0", 
    2967 => "1", 2968 => "0", 2969 to 2971=> "1", 2972 => "0", 2973 => "1", 2974 => "0", 2975 to 2976=> "1", 
    2977 to 2978=> "0", 2979 to 2980=> "1", 2981 to 2982=> "0", 2983 to 2985=> "1", 2986 to 2987=> "0", 2988 => "1", 2989 to 2991=> "0", 
    2992 => "1", 2993 to 2995=> "0", 2996 => "1", 2997 to 2998=> "0", 2999 => "1", 3000 to 3001=> "0", 3002 to 3007=> "1", 
    3008 to 3009=> "0", 3010 => "1", 3011 to 3012=> "0", 3013 => "1", 3014 => "0", 3015 to 3017=> "1", 3018 to 3023=> "0", 
    3024 => "1", 3025 to 3028=> "0", 3029 to 3030=> "1", 3031 => "0", 3032 to 3036=> "1", 3037 to 3040=> "0", 3041 => "1", 
    3042 to 3044=> "0", 3045 to 3046=> "1", 3047 => "0", 3048 to 3049=> "1", 3050 to 3052=> "0", 3053 => "1", 3054 => "0", 
    3055 to 3056=> "1", 3057 to 3060=> "0", 3061 => "1", 3062 to 3063=> "0", 3064 => "1", 3065 => "0", 3066 => "1", 
    3067 => "0", 3068 => "1", 3069 => "0", 3070 => "1", 3071 to 3072=> "0", 3073 => "1", 3074 => "0", 
    3075 to 3081=> "1", 3082 => "0", 3083 to 3084=> "1", 3085 to 3086=> "0", 3087 to 3088=> "1", 3089 => "0", 3090 to 3095=> "1", 
    3096 to 3098=> "0", 3099 => "1", 3100 to 3104=> "0", 3105 to 3107=> "1", 3108 => "0", 3109 => "1", 3110 => "0", 
    3111 to 3113=> "1", 3114 => "0", 3115 => "1", 3116 to 3117=> "0", 3118 => "1", 3119 to 3120=> "0", 3121 => "1", 
    3122 => "0", 3123 to 3125=> "1", 3126 => "0", 3127 to 3132=> "1", 3133 to 3135=> "0" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_bkb is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 3136;
        AddressWidth : INTEGER := 12);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bkb is
    component predict_ensemble_bkb_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bkb_rom_U :  component predict_ensemble_bkb_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


