-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bsm_rom is 
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


architecture rtl of predict_ensemble_bsm_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 to 7=> "00000000", 8 => "00001010", 9 => "00001100", 
    10 => "00000000", 11 => "00001110", 12 => "00010000", 13 => "00010010", 
    14 => "00010100", 15 to 16=> "00000000", 17 => "00010110", 18 => "00011000", 
    19 => "00000000", 20 => "00011010", 21 => "00000000", 22 => "00011100", 
    23 => "00011110", 24 => "00100000", 25 => "00100010", 26 to 27=> "00000000", 
    28 => "00100100", 29 => "00100110", 30 => "00101000", 31 => "00101010", 
    32 => "00101100", 33 => "00101110", 34 => "00000000", 35 => "00110000", 
    36 => "00000000", 37 => "00110010", 38 to 39=> "00000000", 40 => "00110100", 
    41 to 43=> "00000000", 44 => "00110110", 45 to 46=> "00000000", 47 => "00111000", 
    48 => "00000000", 49 => "00111010", 50 => "00111100", 51 => "00111110", 
    52 => "00000000", 53 => "01000000", 54 to 56=> "00000000", 57 => "01000010", 
    58 => "00000000", 59 => "01000100", 60 to 62=> "00000000", 63 => "01000110", 
    64 => "01001000", 65 => "00000000", 66 => "01001010", 67 => "00000000", 
    68 => "01001100", 69 => "01001110", 70 => "01010000", 71 => "01010010", 
    72 to 73=> "00000000", 74 => "01010100", 75 => "00000000", 76 => "01010110", 
    77 => "00000000", 78 => "01011000", 79 => "01011010", 80 => "01011100", 
    81 => "01011110", 82 to 83=> "00000000", 84 => "01100000", 85 => "01100010", 
    86 to 88=> "00000000", 89 => "01100100", 90 to 91=> "00000000", 92 => "01100110", 
    93 => "01101000", 94 => "00000000", 95 => "01101010", 96 => "00000000", 
    97 => "01101100", 98 => "01101110", 99 => "00000000", 100 => "01110000", 
    101 => "00000000", 102 => "01110010", 103 => "01110100", 104 => "01110110", 
    105 => "00000000", 106 => "01111000", 107 => "01111010", 108 to 111=> "00000000", 
    112 => "01111100", 113 => "01111110", 114 => "00000000", 115 => "10000000", 
    116 => "10000010", 117 to 120=> "00000000", 121 => "10000100", 122 => "10000110", 
    123 to 124=> "00000000", 125 => "10001000", 126 to 128=> "00000000", 129 => "10001010", 
    130 to 131=> "00000000", 132 => "10001100", 133 => "00000000", 134 => "10001110", 
    135 => "10010000", 136 => "10010010", 137 => "10010100", 138 => "10010110", 
    139 to 140=> "00000000", 141 => "10011000", 142 => "10011010", 143 to 145=> "00000000", 
    146 => "10011100", 147 => "10011110", 148 => "00000000", 149 => "10100000", 
    150 => "10100010", 151 => "00000000", 152 => "10100100", 153 => "10100110", 
    154 => "10101000", 155 => "10101010", 156 => "10101100", 157 to 159=> "00000000", 
    160 => "10101110", 161 to 167=> "00000000", 168 => "10110000", 169 to 170=> "00000000", 
    171 => "10110010", 172 to 194=> "00000000" );


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

entity predict_ensemble_bsm is
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

architecture arch of predict_ensemble_bsm is
    component predict_ensemble_bsm_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bsm_rom_U :  component predict_ensemble_bsm_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


