-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bWr_rom is 
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


architecture rtl of predict_ensemble_bWr_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 to 5=> "00000000", 6 => "00001010", 7 => "00000000", 8 => "00001100", 
    9 => "00000000", 10 => "00001110", 11 => "00000000", 12 => "00010000", 
    13 => "00010010", 14 to 17=> "00000000", 18 => "00010100", 19 => "00010110", 
    20 => "00000000", 21 => "00011000", 22 => "00000000", 23 => "00011010", 
    24 to 25=> "00000000", 26 => "00011100", 27 => "00000000", 28 => "00011110", 
    29 => "00000000", 30 => "00100000", 31 => "00100010", 32 => "00100100", 
    33 => "00100110", 34 => "00101000", 35 => "00101010", 36 => "00101100", 
    37 => "00000000", 38 => "00101110", 39 => "00110000", 40 to 43=> "00000000", 
    44 => "00110010", 45 to 46=> "00000000", 47 => "00110100", 48 to 50=> "00000000", 
    51 => "00110110", 52 => "00111000", 53 => "00111010", 54 => "00000000", 
    55 => "00111100", 56 => "00000000", 57 => "00111110", 58 => "00000000", 
    59 => "01000000", 60 => "01000010", 61 => "01000100", 62 => "01000110", 
    63 to 64=> "00000000", 65 => "01001000", 66 => "00000000", 67 => "01001010", 
    68 => "00000000", 69 => "01001100", 70 to 71=> "00000000", 72 => "01001110", 
    73 to 74=> "00000000", 75 => "01010000", 76 => "00000000", 77 => "01010010", 
    78 => "00000000", 79 => "01010100", 80 => "00000000", 81 => "01010110", 
    82 => "01011000", 83 => "01011010", 84 => "01011100", 85 to 87=> "00000000", 
    88 => "01011110", 89 to 91=> "00000000", 92 => "01100000", 93 => "01100010", 
    94 to 95=> "00000000", 96 => "01100100", 97 => "01100110", 98 to 100=> "00000000", 
    101 => "01101000", 102 => "01101010", 103 to 104=> "00000000", 105 => "01101100", 
    106 => "01101110", 107 => "01110000", 108 => "01110010", 109 => "01110100", 
    110 => "01110110", 111 => "01111000", 112 => "01111010", 113 to 114=> "00000000", 
    115 => "01111100", 116 => "00000000", 117 => "01111110", 118 => "00000000", 
    119 => "10000000", 120 => "00000000", 121 => "10000010", 122 => "10000100", 
    123 to 126=> "00000000", 127 => "10000110", 128 to 129=> "00000000", 130 => "10001000", 
    131 => "00000000", 132 => "10001010", 133 to 136=> "00000000", 137 => "10001100", 
    138 => "00000000", 139 => "10001110", 140 => "00000000", 141 => "10010000", 
    142 => "00000000", 143 => "10010010", 144 => "00000000", 145 => "10010100", 
    146 => "10010110", 147 to 149=> "00000000", 150 => "10011000", 151 => "10011010", 
    152 => "10011100", 153 => "10011110", 154 => "00000000", 155 => "10100000", 
    156 => "10100010", 157 => "10100100", 158 to 159=> "00000000", 160 => "10100110", 
    161 => "00000000", 162 => "10101000", 163 to 164=> "00000000", 165 => "10101010", 
    166 => "10101100", 167 => "00000000", 168 => "10101110", 169 => "10110000", 
    170 => "10110010", 171 to 172=> "00000000", 173 => "10110100", 174 => "10110110", 
    175 => "10111000", 176 to 194=> "00000000" );


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

entity predict_ensemble_bWr is
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

architecture arch of predict_ensemble_bWr is
    component predict_ensemble_bWr_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bWr_rom_U :  component predict_ensemble_bWr_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


