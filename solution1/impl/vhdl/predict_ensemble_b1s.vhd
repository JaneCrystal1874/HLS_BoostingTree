-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_b1s_rom is 
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


architecture rtl of predict_ensemble_b1s_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00001010", 5 => "00001100", 6 => "00001110", 7 => "00010000", 
    8 => "00010010", 9 => "00010100", 10 => "00010110", 11 => "00011000", 
    12 => "00011010", 13 => "00011100", 14 => "00011110", 15 => "00100000", 
    16 => "00100010", 17 => "00100100", 18 => "00100110", 19 => "00101000", 
    20 to 21=> "00000000", 22 => "00101010", 23 => "00000000", 24 => "00101100", 
    25 to 27=> "00000000", 28 => "00101110", 29 => "00110000", 30 => "00110010", 
    31 => "00110100", 32 => "00110110", 33 => "00111000", 34 => "00111010", 
    35 to 39=> "00000000", 40 => "00111100", 41 => "00111110", 42 => "00000000", 
    43 => "01000000", 44 => "00000000", 45 => "01000010", 46 => "01000100", 
    47 => "01000110", 48 => "01001000", 49 => "01001010", 50 => "01001100", 
    51 => "01001110", 52 to 53=> "00000000", 54 => "01010000", 55 => "01010010", 
    56 => "00000000", 57 => "01010100", 58 => "00000000", 59 => "01010110", 
    60 => "01011000", 61 to 63=> "00000000", 64 => "01011010", 65 => "01011100", 
    66 => "01011110", 67 => "00000000", 68 => "01100000", 69 => "00000000", 
    70 => "01100010", 71 to 72=> "00000000", 73 => "01100100", 74 => "01100110", 
    75 => "00000000", 76 => "01101000", 77 => "00000000", 78 => "01101010", 
    79 => "01101100", 80 => "01101110", 81 to 82=> "00000000", 83 => "01110000", 
    84 => "01110010", 85 to 88=> "00000000", 89 => "01110100", 90 to 92=> "00000000", 
    93 => "01110110", 94 to 96=> "00000000", 97 => "01111000", 98 => "00000000", 
    99 => "01111010", 100 => "01111100", 101 to 102=> "00000000", 103 => "01111110", 
    104 => "00000000", 105 => "10000000", 106 => "00000000", 107 => "10000010", 
    108 => "10000100", 109 => "00000000", 110 => "10000110", 111 to 112=> "00000000", 
    113 => "10001000", 114 => "10001010", 115 to 116=> "00000000", 117 => "10001100", 
    118 => "10001110", 119 to 120=> "00000000", 121 => "10010000", 122 => "10010010", 
    123 to 124=> "00000000", 125 => "10010100", 126 => "00000000", 127 => "10010110", 
    128 => "00000000", 129 => "10011000", 130 => "10011010", 131 => "10011100", 
    132 => "00000000", 133 => "10011110", 134 to 136=> "00000000", 137 => "10100000", 
    138 => "10100010", 139 to 140=> "00000000", 141 => "10100100", 142 => "10100110", 
    143 to 150=> "00000000", 151 => "10101000", 152 to 153=> "00000000", 154 => "10101010", 
    155 => "10101100", 156 => "00000000", 157 => "10101110", 158 => "00000000", 
    159 => "10110000", 160 => "00000000", 161 => "10110010", 162 => "00000000", 
    163 => "10110100", 164 => "10110110", 165 to 166=> "00000000", 167 => "10111000", 
    168 to 177=> "00000000", 178 => "10111010", 179 => "10111100", 180 to 181=> "00000000", 
    182 => "10111110", 183 to 194=> "00000000" );


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

entity predict_ensemble_b1s is
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

architecture arch of predict_ensemble_b1s is
    component predict_ensemble_b1s_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_b1s_rom_U :  component predict_ensemble_b1s_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


