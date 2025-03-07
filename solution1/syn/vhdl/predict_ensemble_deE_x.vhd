-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_deE_x_rom is 
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


architecture rtl of predict_ensemble_deE_x_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000000", 
    4 => "00000110", 5 => "00001000", 6 => "00000000", 7 => "00001010", 
    8 => "00001100", 9 to 10=> "00000000", 11 => "00001110", 12 => "00000000", 
    13 => "00010000", 14 to 15=> "00000000", 16 => "00010010", 17 => "00000000", 
    18 => "00010100", 19 => "00010110", 20 => "00011000", 21 to 23=> "00000000", 
    24 => "00011010", 25 => "00000000", 26 => "00011100", 27 => "00000000", 
    28 => "00011110", 29 => "00100000", 30 => "00000000", 31 => "00100010", 
    32 to 33=> "00000000", 34 => "00100100", 35 => "00100110", 36 => "00101000", 
    37 => "00101010", 38 to 39=> "00000000", 40 => "00101100", 41 => "00101110", 
    42 to 43=> "00000000", 44 => "00110000", 45 => "00110010", 46 => "00110100", 
    47 to 50=> "00000000", 51 => "00110110", 52 => "00111000", 53 => "00111010", 
    54 => "00000000", 55 => "00111100", 56 => "00111110", 57 to 60=> "00000000", 
    61 => "01000000", 62 => "00000000", 63 => "01000010", 64 => "01000100", 
    65 => "01000110", 66 to 68=> "00000000", 69 => "01001000", 70 => "00000000", 
    71 => "01001010", 72 => "01001100", 73 => "01001110", 74 => "00000000", 
    75 => "01010000", 76 => "00000000", 77 => "01010010", 78 to 81=> "00000000", 
    82 => "01010100", 83 => "01010110", 84 => "01011000", 85 => "00000000", 
    86 => "01011010", 87 => "01011100", 88 to 89=> "00000000", 90 => "01011110", 
    91 to 92=> "00000000", 93 => "01100000", 94 => "01100010", 95 => "01100100", 
    96 => "00000000", 97 => "01100110", 98 => "00000000", 99 => "01101000", 
    100 => "01101010", 101 => "01101100", 102 => "00000000", 103 => "01101110", 
    104 to 105=> "00000000", 106 => "01110000", 107 to 108=> "00000000", 109 => "01110010", 
    110 => "01110100", 111 to 112=> "00000000", 113 => "01110110", 114 to 115=> "00000000", 
    116 => "01111000", 117 => "01111010", 118 => "01111100", 119 => "00000000", 
    120 => "01111110", 121 => "10000000", 122 to 123=> "00000000", 124 => "10000010", 
    125 => "10000100", 126 to 127=> "00000000", 128 => "10000110", 129 => "10001000", 
    130 => "10001010", 131 to 134=> "00000000", 135 => "10001100", 136 to 137=> "00000000", 
    138 => "10001110", 139 => "10010000", 140 to 141=> "00000000", 142 => "10010010", 
    143 => "10010100", 144 to 145=> "00000000", 146 => "10010110", 147 => "10011000", 
    148 => "10011010", 149 => "00000000", 150 => "10011100", 151 => "00000000", 
    152 => "10011110", 153 to 154=> "00000000", 155 => "10100000", 156 => "10100010", 
    157 to 161=> "00000000", 162 => "10100100", 163 => "10100110", 164 => "10101000", 
    165 => "10101010", 166 to 167=> "00000000", 168 => "10101100", 169 to 171=> "00000000", 
    172 => "10101110", 173 => "00000000", 174 => "10110000", 175 => "00000000", 
    176 => "10110010", 177 => "10110100", 178 => "00000000", 179 => "10110110", 
    180 => "00000000", 181 => "10111000", 182 => "10111010", 183 to 185=> "00000000", 
    186 => "10111100", 187 to 194=> "00000000" );


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

entity predict_ensemble_deE_x is
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

architecture arch of predict_ensemble_deE_x is
    component predict_ensemble_deE_x_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_deE_x_rom_U :  component predict_ensemble_deE_x_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


