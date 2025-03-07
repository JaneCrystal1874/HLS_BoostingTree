-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_kbM_rom is 
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


architecture rtl of predict_ensemble_kbM_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00001000", 
    4 => "00001010", 5 => "00001100", 6 => "00001110", 7 => "00010000", 
    8 => "00010010", 9 to 10=> "00000000", 11 => "00010100", 12 to 13=> "00000000", 
    14 => "00010110", 15 => "00011000", 16 => "00011010", 17 => "00011100", 
    18 => "00000000", 19 => "00011110", 20 to 21=> "00000000", 22 => "00100000", 
    23 => "00000000", 24 => "00100010", 25 => "00000000", 26 => "00100100", 
    27 => "00100110", 28 => "00101000", 29 => "00101010", 30 => "00101100", 
    31 => "00000000", 32 => "00101110", 33 => "00000000", 34 => "00110000", 
    35 => "00000000", 36 => "00110010", 37 => "00000000", 38 => "00110100", 
    39 => "00110110", 40 => "00000000", 41 => "00111000", 42 to 44=> "00000000", 
    45 => "00111010", 46 => "00111100", 47 => "00111110", 48 => "00000000", 
    49 => "01000000", 50 to 51=> "00000000", 52 => "01000010", 53 => "01000100", 
    54 to 55=> "00000000", 56 => "01000110", 57 => "00000000", 58 => "01001000", 
    59 => "00000000", 60 => "01001010", 61 => "01001100", 62 => "01001110", 
    63 => "00000000", 64 => "01010000", 65 to 70=> "00000000", 71 => "01010010", 
    72 to 73=> "00000000", 74 => "01010100", 75 to 77=> "00000000", 78 => "01010110", 
    79 to 82=> "00000000", 83 => "01011000", 84 => "01011010", 85 => "01011100", 
    86 => "01011110", 87 => "00000000", 88 => "01100000", 89 => "01100010", 
    90 => "01100100", 91 => "01100110", 92 => "00000000", 93 => "01101000", 
    94 => "01101010", 95 => "00000000", 96 => "01101100", 97 to 98=> "00000000", 
    99 => "01101110", 100 => "01110000", 101 to 102=> "00000000", 103 => "01110010", 
    104 => "00000000", 105 => "01110100", 106 to 108=> "00000000", 109 => "01110110", 
    110 => "01111000", 111 => "01111010", 112 => "01111100", 113 => "01111110", 
    114 to 115=> "00000000", 116 => "10000000", 117 => "00000000", 118 => "10000010", 
    119 => "00000000", 120 => "10000100", 121 => "10000110", 122 => "10001000", 
    123 => "00000000", 124 => "10001010", 125 to 132=> "00000000", 133 => "10001100", 
    134 => "00000000", 135 => "10001110", 136 => "10010000", 137 => "10010010", 
    138 => "10010100", 139 to 140=> "00000000", 141 => "10010110", 142 => "10011000", 
    143 => "00000000", 144 => "10011010", 145 => "00000000", 146 => "10011100", 
    147 => "10011110", 148 => "10100000", 149 to 154=> "00000000", 155 => "10100010", 
    156 => "10100100", 157 => "10100110", 158 to 162=> "00000000", 163 => "10101000", 
    164 => "10101010", 165 to 168=> "00000000", 169 => "10101100", 170 => "10101110", 
    171 to 172=> "00000000", 173 => "10110000", 174 to 175=> "00000000", 176 => "10110010", 
    177 to 194=> "00000000" );


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

entity predict_ensemble_kbM is
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

architecture arch of predict_ensemble_kbM is
    component predict_ensemble_kbM_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_kbM_rom_U :  component predict_ensemble_kbM_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


