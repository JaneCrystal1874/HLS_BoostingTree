-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dXL_rom is 
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


architecture rtl of predict_ensemble_dXL_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000000", 2 => "00000100", 3 => "00000110", 
    4 => "00001000", 5 to 6=> "00000000", 7 => "00001010", 8 => "00000000", 
    9 => "00001100", 10 => "00001110", 11 => "00010000", 12 => "00000000", 
    13 => "00010010", 14 => "00000000", 15 => "00010100", 16 to 17=> "00000000", 
    18 => "00010110", 19 => "00000000", 20 => "00011000", 21 => "00011010", 
    22 => "00000000", 23 => "00011100", 24 to 25=> "00000000", 26 => "00011110", 
    27 => "00000000", 28 => "00100000", 29 => "00000000", 30 => "00100010", 
    31 => "00000000", 32 => "00100100", 33 => "00000000", 34 => "00100110", 
    35 to 37=> "00000000", 38 => "00101000", 39 => "00101010", 40 to 41=> "00000000", 
    42 => "00101100", 43 => "00101110", 44 => "00000000", 45 => "00110000", 
    46 => "00110010", 47 => "00110100", 48 to 51=> "00000000", 52 => "00110110", 
    53 => "00000000", 54 => "00111000", 55 => "00000000", 56 => "00111010", 
    57 => "00111100", 58 => "00111110", 59 => "01000000", 60 => "00000000", 
    61 => "01000010", 62 => "01000100", 63 => "01000110", 64 => "01001000", 
    65 => "01001010", 66 to 67=> "00000000", 68 => "01001100", 69 to 71=> "00000000", 
    72 => "01001110", 73 => "01010000", 74 => "01010010", 75 => "01010100", 
    76 => "01010110", 77 => "01011000", 78 => "01011010", 79 to 80=> "00000000", 
    81 => "01011100", 82 => "00000000", 83 => "01011110", 84 to 85=> "00000000", 
    86 => "01100000", 87 to 90=> "00000000", 91 => "01100010", 92 => "01100100", 
    93 to 95=> "00000000", 96 => "01100110", 97 => "00000000", 98 => "01101000", 
    99 => "00000000", 100 => "01101010", 101 => "01101100", 102 => "01101110", 
    103 => "01110000", 104 to 105=> "00000000", 106 => "01110010", 107 to 109=> "00000000", 
    110 => "01110100", 111 => "01110110", 112 => "01111000", 113 to 114=> "00000000", 
    115 => "01111010", 116 => "01111100", 117 to 119=> "00000000", 120 => "01111110", 
    121 => "10000000", 122 => "00000000", 123 => "10000010", 124 to 125=> "00000000", 
    126 => "10000100", 127 => "10000110", 128 => "00000000", 129 => "10001000", 
    130 to 131=> "00000000", 132 => "10001010", 133 => "10001100", 134 => "10001110", 
    135 => "00000000", 136 => "10010000", 137 to 138=> "00000000", 139 => "10010010", 
    140 to 141=> "00000000", 142 => "10010100", 143 to 147=> "00000000", 148 => "10010110", 
    149 => "10011000", 150 => "00000000", 151 => "10011010", 152 => "10011100", 
    153 => "10011110", 154 => "10100000", 155 to 156=> "00000000", 157 => "10100010", 
    158 to 160=> "00000000", 161 => "10100100", 162 => "10100110", 163 => "10101000", 
    164 to 165=> "00000000", 166 => "10101010", 167 => "10101100", 168 to 171=> "00000000", 
    172 => "10101110", 173 => "00000000", 174 => "10110000", 175 to 194=> "00000000" );


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

entity predict_ensemble_dXL is
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

architecture arch of predict_ensemble_dXL is
    component predict_ensemble_dXL_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dXL_rom_U :  component predict_ensemble_dXL_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


