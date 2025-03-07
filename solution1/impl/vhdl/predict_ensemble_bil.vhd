-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bil_rom is 
    generic(
             DWIDTH     : integer := 8; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_bil_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 to 7=> "00000000", 8 => "00001010", 9 => "00001100", 
    10 => "00001110", 11 => "00000000", 12 => "00010000", 13 => "00010010", 
    14 => "00010100", 15 to 19=> "00000000", 20 => "00010110", 21 => "00011000", 
    22 => "00011010", 23 to 24=> "00000000", 25 => "00011100", 26 => "00011110", 
    27 => "00100000", 28 => "00000000", 29 => "00100010", 30 => "00100100", 
    31 => "00100110", 32 to 34=> "00000000", 35 => "00101000", 36 to 37=> "00000000", 
    38 => "00101010", 39 => "00101100", 40 => "00101110", 41 to 42=> "00000000", 
    43 => "00110000", 44 => "00000000", 45 => "00110010", 46 to 47=> "00000000", 
    48 => "00110100", 49 => "00110110", 50 to 51=> "00000000", 52 => "00111000", 
    53 => "00111010", 54 => "00111100", 55 => "00000000", 56 => "00111110", 
    57 => "00000000", 58 => "01000000", 59 => "00000000", 60 => "01000010", 
    61 => "01000100", 62 to 65=> "00000000", 66 => "01000110", 67 => "00000000", 
    68 => "01001000", 69 => "01001010", 70 => "01001100", 71 => "01001110", 
    72 to 75=> "00000000", 76 => "01010000", 77 => "01010010", 78 => "01010100", 
    79 => "01010110", 80 => "01011000", 81 to 82=> "00000000", 83 => "01011010", 
    84 => "01011100", 85 to 86=> "00000000", 87 => "01011110", 88 => "01100000", 
    89 to 92=> "00000000", 93 => "01100010", 94 => "01100100", 95 => "01100110", 
    96 => "00000000", 97 => "01101000", 98 => "01101010", 99 to 100=> "00000000", 
    101 => "01101100", 102 => "01101110", 103 to 104=> "00000000", 105 => "01110000", 
    106 => "01110010", 107 => "01110100", 108 to 109=> "00000000", 110 => "01110110", 
    111 => "01111000", 112 => "01111010", 113 => "01111100", 114 => "01111110", 
    115 => "10000000", 116 => "10000010", 117 => "10000100", 118 => "00000000", 
    119 => "10000110", 120 => "00000000", 121 => "10001000", 122 => "00000000", 
    123 => "10001010", 124 => "10001100", 125 => "10001110", 126 => "10010000", 
    127 => "00000000", 128 => "10010010", 129 => "00000000", 130 => "10010100", 
    131 => "10010110", 132 => "00000000", 133 => "10011000", 134 => "10011010", 
    135 to 137=> "00000000", 138 => "10011100", 139 => "10011110", 140 => "10100000", 
    141 => "10100010", 142 => "10100100", 143 => "00000000", 144 => "10100110", 
    145 => "10101000", 146 to 148=> "00000000", 149 => "10101010", 150 to 153=> "00000000", 
    154 => "10101100", 155 to 160=> "00000000", 161 => "10101110", 162 => "10110000", 
    163 => "00000000", 164 => "10110010", 165 => "10110100", 166 to 172=> "00000000", 
    173 => "10110110", 174 to 180=> "00000000", 181 => "10111000", 182 => "10111010", 
    183 to 194=> "00000000" );


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

entity predict_ensemble_bil is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_bil is
    component predict_ensemble_bil_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bil_rom_U :  component predict_ensemble_bil_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


