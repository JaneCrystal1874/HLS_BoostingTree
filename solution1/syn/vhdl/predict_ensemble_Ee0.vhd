-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Ee0_rom is 
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


architecture rtl of predict_ensemble_Ee0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "00000010", 1 => "00000100", 2 => "00000110", 3 => "00000000", 
    4 => "00001000", 5 => "00000000", 6 => "00001010", 7 => "00001100", 
    8 => "00001110", 9 to 10=> "00000000", 11 => "00010000", 12 => "00010010", 
    13 => "00000000", 14 => "00010100", 15 => "00010110", 16 to 18=> "00000000", 
    19 => "00011000", 20 => "00011010", 21 => "00011100", 22 to 24=> "00000000", 
    25 => "00011110", 26 => "00100000", 27 to 28=> "00000000", 29 => "00100010", 
    30 to 31=> "00000000", 32 => "00100100", 33 to 35=> "00000000", 36 => "00100110", 
    37 => "00101000", 38 => "00000000", 39 => "00101010", 40 => "00101100", 
    41 => "00101110", 42 => "00000000", 43 => "00110000", 44 => "00110010", 
    45 => "00110100", 46 to 48=> "00000000", 49 => "00110110", 50 => "00111000", 
    51 to 52=> "00000000", 53 => "00111010", 54 to 55=> "00000000", 56 => "00111100", 
    57 => "00111110", 58 to 59=> "00000000", 60 => "01000000", 61 => "01000010", 
    62 => "00000000", 63 => "01000100", 64 => "01000110", 65 to 67=> "00000000", 
    68 => "01001000", 69 => "01001010", 70 => "01001100", 71 to 73=> "00000000", 
    74 => "01001110", 75 => "01010000", 76 => "01010010", 77 => "01010100", 
    78 to 81=> "00000000", 82 => "01010110", 83 => "00000000", 84 => "01011000", 
    85 => "01011010", 86 => "01011100", 87 => "01011110", 88 => "01100000", 
    89 => "01100010", 90 => "00000000", 91 => "01100100", 92 => "01100110", 
    93 => "00000000", 94 => "01101000", 95 => "01101010", 96 => "01101100", 
    97 => "01101110", 98 to 100=> "00000000", 101 => "01110000", 102 => "00000000", 
    103 => "01110010", 104 => "00000000", 105 => "01110100", 106 to 108=> "00000000", 
    109 => "01110110", 110 to 111=> "00000000", 112 => "01111000", 113 to 115=> "00000000", 
    116 => "01111010", 117 to 118=> "00000000", 119 => "01111100", 120 => "01111110", 
    121 to 125=> "00000000", 126 => "10000000", 127 => "00000000", 128 => "10000010", 
    129 => "10000100", 130 => "10000110", 131 => "00000000", 132 => "10001000", 
    133 => "10001010", 134 to 135=> "00000000", 136 => "10001100", 137 => "10001110", 
    138 => "00000000", 139 => "10010000", 140 => "00000000", 141 => "10010010", 
    142 => "10010100", 143 to 144=> "00000000", 145 => "10010110", 146 => "10011000", 
    147 => "10011010", 148 => "00000000", 149 => "10011100", 150 to 151=> "00000000", 
    152 => "10011110", 153 => "10100000", 154 to 156=> "00000000", 157 => "10100010", 
    158 => "10100100", 159 => "00000000", 160 => "10100110", 161 => "10101000", 
    162 => "10101010", 163 to 168=> "00000000", 169 => "10101100", 170 => "10101110", 
    171 => "10110000", 172 to 174=> "00000000", 175 => "10110010", 176 => "10110100", 
    177 => "10110110", 178 to 194=> "00000000" );


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

entity predict_ensemble_Ee0 is
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

architecture arch of predict_ensemble_Ee0 is
    component predict_ensemble_Ee0_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Ee0_rom_U :  component predict_ensemble_Ee0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


