-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bRq_rom is 
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


architecture rtl of predict_ensemble_bRq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 to 5=> "00000000", 
    6 => "00001000", 7 => "00001010", 8 to 9=> "00000000", 10 => "00001100", 
    11 => "00001110", 12 => "00010000", 13 => "00010010", 14 => "00010100", 
    15 => "00010110", 16 to 17=> "00000000", 18 => "00011000", 19 => "00011010", 
    20 => "00011100", 21 => "00011110", 22 to 23=> "00000000", 24 => "00100000", 
    25 => "00100010", 26 => "00000000", 27 => "00100100", 28 => "00100110", 
    29 to 34=> "00000000", 35 => "00101000", 36 => "00000000", 37 => "00101010", 
    38 => "00000000", 39 => "00101100", 40 => "00101110", 41 => "00110000", 
    42 => "00110010", 43 => "00110100", 44 to 47=> "00000000", 48 => "00110110", 
    49 to 53=> "00000000", 54 => "00111000", 55 => "00111010", 56 => "00111100", 
    57 => "00111110", 58 => "01000000", 59 => "00000000", 60 => "01000010", 
    61 to 64=> "00000000", 65 => "01000100", 66 => "01000110", 67 to 68=> "00000000", 
    69 => "01001000", 70 => "01001010", 71 to 72=> "00000000", 73 => "01001100", 
    74 => "01001110", 75 => "01010000", 76 to 78=> "00000000", 79 => "01010010", 
    80 => "01010100", 81 => "01010110", 82 => "01011000", 83 to 84=> "00000000", 
    85 => "01011010", 86 => "00000000", 87 => "01011100", 88 => "00000000", 
    89 => "01011110", 90 => "00000000", 91 => "01100000", 92 => "01100010", 
    93 => "01100100", 94 => "01100110", 95 => "01101000", 96 to 99=> "00000000", 
    100 => "01101010", 101 => "00000000", 102 => "01101100", 103 => "01101110", 
    104 => "00000000", 105 => "01110000", 106 => "00000000", 107 => "01110010", 
    108 => "01110100", 109 => "01110110", 110 to 114=> "00000000", 115 => "01111000", 
    116 => "00000000", 117 => "01111010", 118 => "01111100", 119 => "00000000", 
    120 => "01111110", 121 => "10000000", 122 => "00000000", 123 => "10000010", 
    124 => "10000100", 125 to 127=> "00000000", 128 => "10000110", 129 => "10001000", 
    130 => "10001010", 131 => "10001100", 132 to 134=> "00000000", 135 => "10001110", 
    136 => "10010000", 137 => "10010010", 138 => "10010100", 139 => "00000000", 
    140 => "10010110", 141 => "10011000", 142 => "10011010", 143 to 144=> "00000000", 
    145 => "10011100", 146 => "00000000", 147 => "10011110", 148 => "10100000", 
    149 to 151=> "00000000", 152 => "10100010", 153 to 154=> "00000000", 155 => "10100100", 
    156 => "00000000", 157 => "10100110", 158 => "10101000", 159 => "00000000", 
    160 => "10101010", 161 to 164=> "00000000", 165 => "10101100", 166 => "10101110", 
    167 => "10110000", 168 to 169=> "00000000", 170 => "10110010", 171 => "10110100", 
    172 => "00000000", 173 => "10110110", 174 => "10111000", 175 => "10111010", 
    176 to 194=> "00000000" );


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

entity predict_ensemble_bRq is
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

architecture arch of predict_ensemble_bRq is
    component predict_ensemble_bRq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bRq_rom_U :  component predict_ensemble_bRq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


