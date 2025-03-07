-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bOq_rom is 
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


architecture rtl of predict_ensemble_bOq_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1001", 1 => "0001", 2 => "0111", 3 to 5=> "0000", 6 => "1000", 
    7 => "1011", 8 to 9=> "0000", 10 => "0110", 11 => "1011", 12 => "0101", 
    13 => "0001", 14 => "0111", 15 => "1010", 16 to 17=> "0000", 18 => "1100", 
    19 => "1000", 20 => "0001", 21 => "0011", 22 to 23=> "0000", 24 => "1101", 
    25 => "1000", 26 => "0000", 27 => "1001", 28 => "0101", 29 to 34=> "0000", 
    35 => "1001", 36 => "0000", 37 => "1010", 38 => "0000", 39 => "0111", 
    40 => "1001", 41 => "0100", 42 => "1000", 43 => "1010", 44 to 47=> "0000", 
    48 => "1011", 49 to 53=> "0000", 54 => "1011", 55 => "0100", 56 => "0101", 
    57 => "1010", 58 => "1011", 59 => "0000", 60 => "0001", 61 to 64=> "0000", 
    65 => "0101", 66 => "0001", 67 to 68=> "0000", 69 => "0010", 70 => "1010", 
    71 to 72=> "0000", 73 => "1010", 74 to 75=> "0100", 76 to 78=> "0000", 79 => "1010", 
    80 => "1100", 81 to 82=> "0101", 83 to 84=> "0000", 85 => "0101", 86 => "0000", 
    87 => "0100", 88 => "0000", 89 => "1010", 90 => "0000", 91 => "1101", 
    92 => "1001", 93 => "0110", 94 => "1010", 95 => "0001", 96 to 99=> "0000", 
    100 => "1101", 101 => "0000", 102 => "1010", 103 => "1000", 104 => "0000", 
    105 => "0001", 106 => "0000", 107 => "0100", 108 => "1000", 109 => "0110", 
    110 to 114=> "0000", 115 => "0011", 116 => "0000", 117 => "0110", 118 => "1100", 
    119 => "0000", 120 to 121=> "0011", 122 => "0000", 123 => "1001", 124 => "0010", 
    125 to 127=> "0000", 128 => "0100", 129 => "0001", 130 to 131=> "1101", 132 to 134=> "0000", 
    135 => "0111", 136 => "0001", 137 => "1010", 138 => "1101", 139 => "0000", 
    140 => "1101", 141 => "0110", 142 => "0101", 143 to 144=> "0000", 145 => "1000", 
    146 => "0000", 147 to 148=> "1101", 149 to 151=> "0000", 152 => "1100", 153 to 154=> "0000", 
    155 => "0101", 156 => "0000", 157 => "1010", 158 => "0100", 159 => "0000", 
    160 => "0101", 161 to 164=> "0000", 165 => "0100", 166 => "0110", 167 => "1000", 
    168 to 169=> "0000", 170 => "0110", 171 => "0100", 172 => "0000", 173 to 174=> "0110", 
    175 => "1010", 176 to 194=> "0000" );

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

entity predict_ensemble_bOq is
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

architecture arch of predict_ensemble_bOq is
    component predict_ensemble_bOq_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bOq_rom_U :  component predict_ensemble_bOq_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


