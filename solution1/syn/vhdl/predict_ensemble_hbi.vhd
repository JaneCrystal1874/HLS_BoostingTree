-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_hbi_rom is 
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


architecture rtl of predict_ensemble_hbi_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1101", 1 => "0100", 2 => "1100", 3 => "0101", 4 => "1011", 
    5 => "1000", 6 => "1011", 7 => "0011", 8 => "0111", 9 to 10=> "0000", 
    11 => "0101", 12 to 13=> "0000", 14 => "1011", 15 => "1101", 16 => "0001", 
    17 => "1011", 18 => "0000", 19 => "0010", 20 to 21=> "0000", 22 => "1100", 
    23 => "0000", 24 => "0001", 25 => "0000", 26 => "0001", 27 => "0010", 
    28 => "0100", 29 => "0101", 30 => "1100", 31 => "0000", 32 => "0101", 
    33 => "0000", 34 => "1011", 35 => "0000", 36 => "0101", 37 => "0000", 
    38 => "1010", 39 => "0100", 40 => "0000", 41 => "1101", 42 to 44=> "0000", 
    45 => "0100", 46 => "0101", 47 => "1001", 48 => "0000", 49 => "0110", 
    50 to 51=> "0000", 52 => "0001", 53 => "0010", 54 to 55=> "0000", 56 => "0111", 
    57 => "0000", 58 => "1101", 59 => "0000", 60 => "0101", 61 => "1011", 
    62 => "1001", 63 => "0000", 64 => "0101", 65 to 70=> "0000", 71 => "1100", 
    72 to 73=> "0000", 74 => "0110", 75 to 77=> "0000", 78 => "1011", 79 to 82=> "0000", 
    83 => "0001", 84 => "1011", 85 => "0100", 86 => "0010", 87 => "0000", 
    88 => "0011", 89 => "1010", 90 => "0101", 91 => "1001", 92 => "0000", 
    93 => "1010", 94 => "0001", 95 => "0000", 96 => "0001", 97 to 98=> "0000", 
    99 => "1101", 100 => "0110", 101 to 102=> "0000", 103 => "1100", 104 => "0000", 
    105 => "0110", 106 to 108=> "0000", 109 to 110=> "0001", 111 => "1100", 112 => "0011", 
    113 => "1000", 114 to 115=> "0000", 116 => "1101", 117 => "0000", 118 => "1101", 
    119 => "0000", 120 => "1100", 121 => "0001", 122 => "0110", 123 => "0000", 
    124 => "1001", 125 to 132=> "0000", 133 => "0001", 134 => "0000", 135 => "0101", 
    136 => "1101", 137 => "1001", 138 => "0100", 139 to 140=> "0000", 141 => "0011", 
    142 => "1100", 143 => "0000", 144 => "0011", 145 => "0000", 146 => "0111", 
    147 => "1011", 148 => "0100", 149 to 154=> "0000", 155 => "0101", 156 => "1011", 
    157 => "1100", 158 to 162=> "0000", 163 to 164=> "0111", 165 to 168=> "0000", 169 => "1001", 
    170 => "1100", 171 to 172=> "0000", 173 => "1010", 174 to 175=> "0000", 176 => "0100", 
    177 to 194=> "0000" );

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

entity predict_ensemble_hbi is
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

architecture arch of predict_ensemble_hbi is
    component predict_ensemble_hbi_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_hbi_rom_U :  component predict_ensemble_hbi_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


