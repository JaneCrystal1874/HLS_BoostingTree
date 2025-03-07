-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_ccu_rom is 
    generic(
             DWIDTH     : integer := 1; 
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


architecture rtl of predict_ensemble_ccu_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 to 6=> "1", 7 to 8=> "0", 9 => "1", 10 => "0", 
    11 to 13=> "1", 14 to 15=> "0", 16 to 17=> "1", 18 to 20=> "0", 21 to 22=> "1", 23 to 26=> "0", 27 => "1", 
    28 to 29=> "0", 30 => "1", 31 => "0", 32 => "1", 33 => "0", 34 to 36=> "1", 37 => "0", 
    38 => "1", 39 => "0", 40 to 41=> "1", 42 => "0", 43 => "1", 44 to 46=> "0", 47 to 51=> "1", 
    52 => "0", 53 => "1", 54 to 57=> "0", 58 => "1", 59 => "0", 60 => "1", 61 => "0", 
    62 to 64=> "1", 65 to 67=> "0", 68 => "1", 69 => "0", 70 to 71=> "1", 72 to 74=> "0", 75 to 76=> "1", 
    77 to 78=> "0", 79 to 83=> "1", 84 to 86=> "0", 87 => "1", 88 to 89=> "0", 90 => "1", 91 => "0", 
    92 => "1", 93 => "0", 94 => "1", 95 => "0", 96 => "1", 97 to 101=> "0", 102 => "1", 
    103 to 108=> "0", 109 => "1", 110 => "0", 111 => "1", 112 => "0", 113 to 114=> "1", 115 => "0", 
    116 => "1", 117 to 119=> "0", 120 to 124=> "1", 125 to 127=> "0", 128 to 129=> "1", 130 to 132=> "0", 133 to 136=> "1", 
    137 to 138=> "0", 139 to 140=> "1", 141 to 145=> "0", 146 to 147=> "1", 148 => "0", 149 to 154=> "1", 155 => "0", 
    156 => "1", 157 to 158=> "0", 159 to 160=> "1", 161 to 163=> "0", 164 => "1", 165 => "0", 166 to 170=> "1", 
    171 to 172=> "0", 173 to 176=> "1", 177 => "0", 178 to 179=> "1", 180 to 181=> "0", 182 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_ccu is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_ccu is
    component predict_ensemble_ccu_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_ccu_rom_U :  component predict_ensemble_ccu_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


