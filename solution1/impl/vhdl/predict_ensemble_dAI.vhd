-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_dAI_rom is 
    generic(
             DWIDTH     : integer := 4; 
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


architecture rtl of predict_ensemble_dAI_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1011", 1 => "0000", 2 => "0101", 3 => "0111", 4 => "0000", 
    5 => "1001", 6 => "0000", 7 => "1000", 8 => "0000", 9 => "1011", 
    10 to 11=> "0000", 12 => "1011", 13 => "0000", 14 => "1011", 15 => "0000", 
    16 => "1011", 17 => "0000", 18 => "0101", 19 => "1101", 20 => "0000", 
    21 => "1010", 22 to 23=> "0010", 24 => "0000", 25 => "0100", 26 => "1100", 
    27 => "0010", 28 => "0000", 29 => "1000", 30 => "0000", 31 => "0110", 
    32 => "1100", 33 to 37=> "0000", 38 => "1011", 39 => "0000", 40 => "1011", 
    41 => "0000", 42 => "0011", 43 => "0000", 44 => "1011", 45 => "0000", 
    46 => "1001", 47 => "1010", 48 => "0011", 49 => "1001", 50 => "0000", 
    51 => "1001", 52 to 53=> "0000", 54 => "1001", 55 => "0000", 56 => "0111", 
    57 => "0101", 58 => "0011", 59 => "0000", 60 => "1010", 61 => "0000", 
    62 => "1001", 63 => "1011", 64 to 66=> "0000", 67 to 68=> "1010", 69 => "0000", 
    70 => "0100", 71 => "0000", 72 => "0110", 73 => "1010", 74 to 76=> "0000", 
    77 => "1101", 78 => "0000", 79 => "1010", 80 => "0011", 81 => "0001", 
    82 => "0011", 83 => "0000", 84 => "1001", 85 => "1011", 86 => "1100", 
    87 to 90=> "0000", 91 => "0111", 92 => "0000", 93 => "0100", 94 to 95=> "0000", 
    96 => "0110", 97 to 99=> "0000", 100 => "1011", 101 to 102=> "0000", 103 => "0001", 
    104 => "0000", 105 => "0011", 106 => "0000", 107 => "0010", 108 => "0000", 
    109 => "0011", 110 => "0000", 111 => "0001", 112 => "0000", 113 => "0010", 
    114 => "0000", 115 => "1000", 116 => "0001", 117 => "0110", 118 to 122=> "0000", 
    123 => "1001", 124 => "0011", 125 => "1001", 126 => "0000", 127 => "0101", 
    128 => "0000", 129 => "0011", 130 to 132=> "0000", 133 => "1100", 134 => "0000", 
    135 => "1010", 136 => "0000", 137 => "1010", 138 => "0000", 139 => "1000", 
    140 => "0011", 141 => "0111", 142 to 144=> "0000", 145 => "1011", 146 => "1100", 
    147 => "0001", 148 => "0000", 149 => "0101", 150 => "1001", 151 to 152=> "0000", 
    153 => "0101", 154 => "0001", 155 => "0000", 156 => "1100", 157 => "1010", 
    158 => "0000", 159 => "0100", 160 to 162=> "0000", 163 => "1010", 164 => "0001", 
    165 to 166=> "0000", 167 => "0111", 168 to 170=> "0000", 171 => "1010", 172 => "1100", 
    173 => "0000", 174 => "1010", 175 to 194=> "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

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

entity predict_ensemble_dAI is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_dAI is
    component predict_ensemble_dAI_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_dAI_rom_U :  component predict_ensemble_dAI_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


