-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_djF_rom is 
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


architecture rtl of predict_ensemble_djF_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00001010", 7 to 8=> "00000000", 
    9 => "00001100", 10 => "00001110", 11 => "00010000", 12 to 14=> "00000000", 
    15 => "00010010", 16 => "00000000", 17 => "00010100", 18 => "00010110", 
    19 to 20=> "00000000", 21 => "00011000", 22 => "00000000", 23 => "00011010", 
    24 to 25=> "00000000", 26 => "00011100", 27 => "00011110", 28 => "00100000", 
    29 => "00100010", 30 to 31=> "00000000", 32 => "00100100", 33 to 34=> "00000000", 
    35 => "00100110", 36 => "00101000", 37 => "00101010", 38 to 39=> "00000000", 
    40 => "00101100", 41 => "00101110", 42 to 44=> "00000000", 45 => "00110000", 
    46 => "00110010", 47 => "00000000", 48 => "00110100", 49 to 50=> "00000000", 
    51 => "00110110", 52 => "00111000", 53 => "00111010", 54 => "00111100", 
    55 => "00111110", 56 to 58=> "00000000", 59 => "01000000", 60 => "01000010", 
    61 to 63=> "00000000", 64 => "01000100", 65 to 66=> "00000000", 67 => "01000110", 
    68 => "01001000", 69 => "01001010", 70 to 71=> "00000000", 72 => "01001100", 
    73 to 75=> "00000000", 76 => "01001110", 77 => "00000000", 78 => "01010000", 
    79 => "01010010", 80 to 81=> "00000000", 82 => "01010100", 83 => "01010110", 
    84 => "00000000", 85 => "01011000", 86 => "00000000", 87 => "01011010", 
    88 => "01011100", 89 => "01011110", 90 => "00000000", 91 => "01100000", 
    92 to 93=> "00000000", 94 => "01100010", 95 => "01100100", 96 to 97=> "00000000", 
    98 => "01100110", 99 => "01101000", 100 => "01101010", 101 to 102=> "00000000", 
    103 => "01101100", 104 => "00000000", 105 => "01101110", 106 to 107=> "00000000", 
    108 => "01110000", 109 => "01110010", 110 => "01110100", 111 to 114=> "00000000", 
    115 => "01110110", 116 => "00000000", 117 => "01111000", 118 => "00000000", 
    119 => "01111010", 120 => "01111100", 121 => "01111110", 122 => "10000000", 
    123 => "00000000", 124 => "10000010", 125 to 128=> "00000000", 129 => "10000100", 
    130 => "10000110", 131 to 132=> "00000000", 133 => "10001000", 134 => "10001010", 
    135 => "10001100", 136 to 138=> "00000000", 139 => "10001110", 140 => "10010000", 
    141 => "10010010", 142 => "10010100", 143 => "10010110", 144 => "10011000", 
    145 => "00000000", 146 => "10011010", 147 => "10011100", 148 => "00000000", 
    149 => "10011110", 150 to 153=> "00000000", 154 => "10100000", 155 to 158=> "00000000", 
    159 => "10100010", 160 => "10100100", 161 => "10100110", 162 => "10101000", 
    163 => "00000000", 164 => "10101010", 165 to 166=> "00000000", 167 => "10101100", 
    168 => "10101110", 169 to 172=> "00000000", 173 => "10110000", 174 to 175=> "00000000", 
    176 => "10110010", 177 => "00000000", 178 => "10110100", 179 => "00000000", 
    180 => "10110110", 181 => "10111000", 182 to 194=> "00000000" );


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

entity predict_ensemble_djF is
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

architecture arch of predict_ensemble_djF is
    component predict_ensemble_djF_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_djF_rom_U :  component predict_ensemble_djF_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


