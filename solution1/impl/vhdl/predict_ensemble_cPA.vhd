-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cPA_rom is 
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


architecture rtl of predict_ensemble_cPA_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000000", 3 => "00000110", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00001100", 
    8 => "00001110", 9 => "00000000", 10 => "00010000", 11 to 12=> "00000000", 
    13 => "00010010", 14 to 16=> "00000000", 17 => "00010100", 18 => "00010110", 
    19 => "00000000", 20 => "00011000", 21 to 23=> "00000000", 24 => "00011010", 
    25 => "00011100", 26 to 27=> "00000000", 28 => "00011110", 29 => "00000000", 
    30 => "00100000", 31 => "00100010", 32 => "00000000", 33 => "00100100", 
    34 => "00000000", 35 => "00100110", 36 => "00000000", 37 => "00101000", 
    38 => "00000000", 39 => "00101010", 40 => "00000000", 41 => "00101100", 
    42 => "00101110", 43 => "00000000", 44 => "00110000", 45 => "00110010", 
    46 => "00110100", 47 => "00000000", 48 => "00110110", 49 => "00111000", 
    50 to 51=> "00000000", 52 => "00111010", 53 => "00000000", 54 => "00111100", 
    55 => "00000000", 56 => "00111110", 57 => "00000000", 58 => "01000000", 
    59 => "00000000", 60 => "01000010", 61 => "00000000", 62 => "01000100", 
    63 to 64=> "00000000", 65 => "01000110", 66 => "00000000", 67 => "01001000", 
    68 => "01001010", 69 => "01001100", 70 => "01001110", 71 to 72=> "00000000", 
    73 => "01010000", 74 => "01010010", 75 => "01010100", 76 to 81=> "00000000", 
    82 => "01010110", 83 => "00000000", 84 => "01011000", 85 => "00000000", 
    86 => "01011010", 87 => "00000000", 88 => "01011100", 89 => "01011110", 
    90 => "00000000", 91 => "01100000", 92 => "00000000", 93 => "01100010", 
    94 to 95=> "00000000", 96 => "01100100", 97 => "01100110", 98 => "00000000", 
    99 => "01101000", 100 => "01101010", 101 => "01101100", 102 => "01101110", 
    103 => "01110000", 104 => "01110010", 105 => "00000000", 106 => "01110100", 
    107 => "00000000", 108 => "01110110", 109 => "01111000", 110 => "01111010", 
    111 => "01111100", 112 => "01111110", 113 to 119=> "00000000", 120 => "10000000", 
    121 => "00000000", 122 => "10000010", 123 => "00000000", 124 => "10000100", 
    125 to 126=> "00000000", 127 => "10000110", 128 => "00000000", 129 => "10001000", 
    130 => "10001010", 131 => "00000000", 132 => "10001100", 133 => "10001110", 
    134 to 136=> "00000000", 137 => "10010000", 138 to 139=> "00000000", 140 => "10010010", 
    141 to 142=> "00000000", 143 => "10010100", 144 => "10010110", 145 to 146=> "00000000", 
    147 => "10011000", 148 => "10011010", 149 => "00000000", 150 => "10011100", 
    151 to 154=> "00000000", 155 => "10011110", 156 => "10100000", 157 => "10100010", 
    158 => "10100100", 159 => "00000000", 160 => "10100110", 161 => "00000000", 
    162 => "10101000", 163 => "10101010", 164 to 166=> "00000000", 167 => "10101100", 
    168 => "10101110", 169 => "00000000", 170 => "10110000", 171 => "00000000", 
    172 => "10110010", 173 => "10110100", 174 to 176=> "00000000", 177 => "10110110", 
    178 to 179=> "00000000", 180 => "10111000", 181 to 182=> "00000000", 183 => "10111010", 
    184 to 194=> "00000000" );


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

entity predict_ensemble_cPA is
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

architecture arch of predict_ensemble_cPA is
    component predict_ensemble_cPA_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cPA_rom_U :  component predict_ensemble_cPA_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


